FROM python:3

RUN mkdir /django
WORKDIR /django

COPY ./django_web_app /django
COPY ./requirements.txt /django

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN python manage.py makemigrations
RUN python manage.py migrate

EXPOSE 8000

CMD ["python",  "manage.py", "runserver", "0.0.0.0:8000" ]
