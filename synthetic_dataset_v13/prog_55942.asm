; DESCRIPTION: Places a black line segment connecting (169, 210) to (444, 78).
; PLAN: r0=169(x1), r1=210(y1), r2=444(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 210
LDI r2, 444
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
