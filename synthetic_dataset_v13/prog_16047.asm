; DESCRIPTION: Renders a red line between points (100, 18) and (130, 66).
; PLAN: r0=100(x1), r1=18(y1), r2=130(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 18
LDI r2, 130
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
