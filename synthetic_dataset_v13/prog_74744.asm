; DESCRIPTION: Renders a orange line between points (418, 11) and (54, 172).
; PLAN: r0=418(x1), r1=11(y1), r2=54(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 11
LDI r2, 54
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
