; DESCRIPTION: Places a black line segment connecting (41, 73) to (378, 40).
; PLAN: r0=41(x1), r1=73(y1), r2=378(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 73
LDI r2, 378
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
