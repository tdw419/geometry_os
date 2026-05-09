; DESCRIPTION: Places a black line segment connecting (30, 159) to (86, 85).
; PLAN: r0=30(x1), r1=159(y1), r2=86(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 159
LDI r2, 86
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
