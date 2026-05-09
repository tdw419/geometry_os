; DESCRIPTION: Renders a orange line between points (376, 106) and (130, 117).
; PLAN: r0=376(x1), r1=106(y1), r2=130(x2), r3=117(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 106
LDI r2, 130
LDI r3, 117
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
