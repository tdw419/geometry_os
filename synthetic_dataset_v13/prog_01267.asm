; DESCRIPTION: Places a blue line segment connecting (44, 175) to (491, 227).
; PLAN: r0=44(x1), r1=175(y1), r2=491(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 175
LDI r2, 491
LDI r3, 227
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
