; DESCRIPTION: Renders a blue line between points (273, 41) and (151, 11).
; PLAN: r0=273(x1), r1=41(y1), r2=151(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 41
LDI r2, 151
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
