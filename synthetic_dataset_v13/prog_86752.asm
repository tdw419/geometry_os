; DESCRIPTION: Renders a orange line between points (341, 246) and (64, 79).
; PLAN: r0=341(x1), r1=246(y1), r2=64(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 246
LDI r2, 64
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
