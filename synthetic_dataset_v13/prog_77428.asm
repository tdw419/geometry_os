; DESCRIPTION: Places a white line segment connecting (41, 207) to (136, 23).
; PLAN: r0=41(x1), r1=207(y1), r2=136(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 207
LDI r2, 136
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
