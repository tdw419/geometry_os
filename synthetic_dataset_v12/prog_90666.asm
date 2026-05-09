; DESCRIPTION: Renders a orange line between points (414, 66) and (124, 96).
; PLAN: r0=414(x1), r1=66(y1), r2=124(x2), r3=96(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 66
LDI r2, 124
LDI r3, 96
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
