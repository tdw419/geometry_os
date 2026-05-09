; DESCRIPTION: Renders a yellow line between points (212, 246) and (463, 36).
; PLAN: r0=212(x1), r1=246(y1), r2=463(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 246
LDI r2, 463
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
