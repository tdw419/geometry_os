; DESCRIPTION: Places a blue line segment connecting (422, 178) to (218, 28).
; PLAN: r0=422(x1), r1=178(y1), r2=218(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 178
LDI r2, 218
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
