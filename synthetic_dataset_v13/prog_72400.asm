; DESCRIPTION: Renders a yellow line between points (450, 66) and (130, 106).
; PLAN: r0=450(x1), r1=66(y1), r2=130(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 66
LDI r2, 130
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
