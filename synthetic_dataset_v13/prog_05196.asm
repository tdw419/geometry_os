; DESCRIPTION: Renders a orange line between points (130, 115) and (364, 66).
; PLAN: r0=130(x1), r1=115(y1), r2=364(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 115
LDI r2, 364
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
