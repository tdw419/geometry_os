; DESCRIPTION: Renders a red line between points (376, 87) and (205, 245).
; PLAN: r0=376(x1), r1=87(y1), r2=205(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 87
LDI r2, 205
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
