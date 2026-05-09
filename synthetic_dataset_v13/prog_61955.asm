; DESCRIPTION: Renders a orange line between points (195, 208) and (94, 227).
; PLAN: r0=195(x1), r1=208(y1), r2=94(x2), r3=227(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 208
LDI r2, 94
LDI r3, 227
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
