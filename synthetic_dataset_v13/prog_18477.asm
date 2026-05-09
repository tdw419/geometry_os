; DESCRIPTION: Places a orange line segment connecting (41, 52) to (230, 213).
; PLAN: r0=41(x1), r1=52(y1), r2=230(x2), r3=213(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 52
LDI r2, 230
LDI r3, 213
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
