; DESCRIPTION: Places a blue line segment connecting (175, 54) to (9, 109).
; PLAN: r0=175(x1), r1=54(y1), r2=9(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 54
LDI r2, 9
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
