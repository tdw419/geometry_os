; DESCRIPTION: Places a blue line segment connecting (422, 167) to (3, 244).
; PLAN: r0=422(x1), r1=167(y1), r2=3(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 167
LDI r2, 3
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
