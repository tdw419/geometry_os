; DESCRIPTION: Renders a orange line between points (425, 91) and (103, 130).
; PLAN: r0=425(x1), r1=91(y1), r2=103(x2), r3=130(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 91
LDI r2, 103
LDI r3, 130
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
