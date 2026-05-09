; DESCRIPTION: Renders a orange line between points (336, 64) and (407, 97).
; PLAN: r0=336(x1), r1=64(y1), r2=407(x2), r3=97(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 64
LDI r2, 407
LDI r3, 97
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
