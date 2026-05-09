; DESCRIPTION: Places a black line segment connecting (41, 111) to (60, 201).
; PLAN: r0=41(x1), r1=111(y1), r2=60(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 111
LDI r2, 60
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
