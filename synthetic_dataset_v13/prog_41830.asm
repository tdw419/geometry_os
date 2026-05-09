; DESCRIPTION: Renders a orange line between points (417, 20) and (81, 245).
; PLAN: r0=417(x1), r1=20(y1), r2=81(x2), r3=245(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 20
LDI r2, 81
LDI r3, 245
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
