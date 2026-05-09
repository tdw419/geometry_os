; DESCRIPTION: Places a black line segment connecting (270, 178) to (457, 41).
; PLAN: r0=270(x1), r1=178(y1), r2=457(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 178
LDI r2, 457
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
