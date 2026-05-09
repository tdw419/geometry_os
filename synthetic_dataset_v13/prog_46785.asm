; DESCRIPTION: Renders a orange line between points (128, 192) and (47, 199).
; PLAN: r0=128(x1), r1=192(y1), r2=47(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 192
LDI r2, 47
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
