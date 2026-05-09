; DESCRIPTION: Renders a orange line between points (81, 120) and (9, 156).
; PLAN: r0=81(x1), r1=120(y1), r2=9(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 120
LDI r2, 9
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
