; DESCRIPTION: Renders a orange line between points (427, 223) and (253, 34).
; PLAN: r0=427(x1), r1=223(y1), r2=253(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 223
LDI r2, 253
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
