; DESCRIPTION: Renders a orange line between points (176, 172) and (379, 129).
; PLAN: r0=176(x1), r1=172(y1), r2=379(x2), r3=129(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 172
LDI r2, 379
LDI r3, 129
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
