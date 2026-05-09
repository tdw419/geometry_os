; DESCRIPTION: Renders a magenta line between points (312, 85) and (96, 232).
; PLAN: r0=312(x1), r1=85(y1), r2=96(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 85
LDI r2, 96
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
