; DESCRIPTION: Renders a yellow line between points (452, 246) and (376, 47).
; PLAN: r0=452(x1), r1=246(y1), r2=376(x2), r3=47(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 246
LDI r2, 376
LDI r3, 47
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
