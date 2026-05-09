; DESCRIPTION: Renders a orange line between points (154, 203) and (93, 127).
; PLAN: r0=154(x1), r1=203(y1), r2=93(x2), r3=127(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 203
LDI r2, 93
LDI r3, 127
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
