; DESCRIPTION: Places a blue line segment connecting (422, 28) to (503, 1).
; PLAN: r0=422(x1), r1=28(y1), r2=503(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 28
LDI r2, 503
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
