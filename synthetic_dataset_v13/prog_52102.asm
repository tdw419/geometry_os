; DESCRIPTION: Renders a orange line between points (130, 75) and (156, 187).
; PLAN: r0=130(x1), r1=75(y1), r2=156(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 75
LDI r2, 156
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
