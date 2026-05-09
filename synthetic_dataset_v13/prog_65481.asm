; DESCRIPTION: Renders a yellow line between points (293, 246) and (14, 245).
; PLAN: r0=293(x1), r1=246(y1), r2=14(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 246
LDI r2, 14
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
