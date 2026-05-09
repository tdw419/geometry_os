; DESCRIPTION: Places a black line segment connecting (310, 85) to (106, 230).
; PLAN: r0=310(x1), r1=85(y1), r2=106(x2), r3=230(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 85
LDI r2, 106
LDI r3, 230
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
