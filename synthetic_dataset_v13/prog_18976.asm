; DESCRIPTION: Places a black line segment connecting (41, 86) to (207, 51).
; PLAN: r0=41(x1), r1=86(y1), r2=207(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 86
LDI r2, 207
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
