; DESCRIPTION: Places a purple line segment connecting (243, 222) to (200, 21).
; PLAN: r0=243(x1), r1=222(y1), r2=200(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 222
LDI r2, 200
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
