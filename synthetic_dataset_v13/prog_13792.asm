; DESCRIPTION: Places a black line segment connecting (306, 106) to (14, 90).
; PLAN: r0=306(x1), r1=106(y1), r2=14(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 106
LDI r2, 14
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
