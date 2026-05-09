; DESCRIPTION: Renders a white line between points (119, 41) and (496, 67).
; PLAN: r0=119(x1), r1=41(y1), r2=496(x2), r3=67(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 41
LDI r2, 496
LDI r3, 67
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
