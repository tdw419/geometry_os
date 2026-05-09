; DESCRIPTION: Renders a red line between points (63, 156) and (375, 162).
; PLAN: r0=63(x1), r1=156(y1), r2=375(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 156
LDI r2, 375
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
