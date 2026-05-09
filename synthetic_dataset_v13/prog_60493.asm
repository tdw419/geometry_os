; DESCRIPTION: Renders a blue line between points (290, 41) and (105, 53).
; PLAN: r0=290(x1), r1=41(y1), r2=105(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 41
LDI r2, 105
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
