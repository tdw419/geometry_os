; DESCRIPTION: Renders a orange line between points (229, 181) and (116, 124).
; PLAN: r0=229(x1), r1=181(y1), r2=116(x2), r3=124(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 181
LDI r2, 116
LDI r3, 124
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
