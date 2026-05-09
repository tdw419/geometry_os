; DESCRIPTION: Places a black line segment connecting (449, 75) to (41, 208).
; PLAN: r0=449(x1), r1=75(y1), r2=41(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 75
LDI r2, 41
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
