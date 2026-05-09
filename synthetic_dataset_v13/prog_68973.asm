; DESCRIPTION: Places a orange line segment connecting (407, 41) to (230, 150).
; PLAN: r0=407(x1), r1=41(y1), r2=230(x2), r3=150(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 41
LDI r2, 230
LDI r3, 150
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
