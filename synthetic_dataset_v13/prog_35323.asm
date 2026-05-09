; DESCRIPTION: Renders a black line between points (5, 134) and (103, 122).
; PLAN: r0=5(x1), r1=134(y1), r2=103(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 134
LDI r2, 103
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
