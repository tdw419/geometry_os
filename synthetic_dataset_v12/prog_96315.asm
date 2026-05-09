; DESCRIPTION: Renders a white line between points (386, 251) and (41, 100).
; PLAN: r0=386(x1), r1=251(y1), r2=41(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 251
LDI r2, 41
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
