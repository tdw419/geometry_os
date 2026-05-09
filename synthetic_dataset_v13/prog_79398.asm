; DESCRIPTION: Places a blue line segment connecting (218, 112) to (482, 208).
; PLAN: r0=218(x1), r1=112(y1), r2=482(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 112
LDI r2, 482
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
