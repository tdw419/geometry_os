; DESCRIPTION: Renders a orange line between points (112, 253) and (14, 0).
; PLAN: r0=112(x1), r1=253(y1), r2=14(x2), r3=0(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 253
LDI r2, 14
LDI r3, 0
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
