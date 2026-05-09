; DESCRIPTION: Places a black line segment connecting (86, 105) to (178, 62).
; PLAN: r0=86(x1), r1=105(y1), r2=178(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 105
LDI r2, 178
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
