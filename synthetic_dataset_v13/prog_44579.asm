; DESCRIPTION: Renders a orange line between points (192, 253) and (34, 50).
; PLAN: r0=192(x1), r1=253(y1), r2=34(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 253
LDI r2, 34
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
