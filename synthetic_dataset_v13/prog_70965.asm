; DESCRIPTION: Renders a orange line between points (16, 38) and (191, 251).
; PLAN: r0=16(x1), r1=38(y1), r2=191(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 38
LDI r2, 191
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
