; DESCRIPTION: Places a black line segment connecting (429, 41) to (15, 188).
; PLAN: r0=429(x1), r1=41(y1), r2=15(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 41
LDI r2, 15
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
