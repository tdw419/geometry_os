; DESCRIPTION: Places a blue line segment connecting (243, 218) to (43, 35).
; PLAN: r0=243(x1), r1=218(y1), r2=43(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 218
LDI r2, 43
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
