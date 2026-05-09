; DESCRIPTION: Places a white line segment connecting (185, 15) to (155, 78).
; PLAN: r0=185(x1), r1=15(y1), r2=155(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 15
LDI r2, 155
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
