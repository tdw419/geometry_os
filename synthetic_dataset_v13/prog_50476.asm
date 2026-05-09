; DESCRIPTION: Renders a orange line between points (325, 16) and (472, 40).
; PLAN: r0=325(x1), r1=16(y1), r2=472(x2), r3=40(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 16
LDI r2, 472
LDI r3, 40
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
