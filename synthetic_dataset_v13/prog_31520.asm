; DESCRIPTION: Places a black line segment connecting (381, 41) to (354, 114).
; PLAN: r0=381(x1), r1=41(y1), r2=354(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 41
LDI r2, 354
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
