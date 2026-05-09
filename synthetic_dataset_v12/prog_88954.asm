; DESCRIPTION: Renders a orange line between points (211, 9) and (253, 197).
; PLAN: r0=211(x1), r1=9(y1), r2=253(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 9
LDI r2, 253
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
