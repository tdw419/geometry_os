; DESCRIPTION: Renders a orange line between points (282, 73) and (135, 245).
; PLAN: r0=282(x1), r1=73(y1), r2=135(x2), r3=245(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 73
LDI r2, 135
LDI r3, 245
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
