; DESCRIPTION: Renders a white line between points (128, 200) and (155, 41).
; PLAN: r0=128(x1), r1=200(y1), r2=155(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 200
LDI r2, 155
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
