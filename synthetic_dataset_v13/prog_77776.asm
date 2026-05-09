; DESCRIPTION: Places a black line segment connecting (136, 41) to (44, 254).
; PLAN: r0=136(x1), r1=41(y1), r2=44(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 41
LDI r2, 44
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
