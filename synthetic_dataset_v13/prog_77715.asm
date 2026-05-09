; DESCRIPTION: Renders a orange line between points (412, 52) and (454, 80).
; PLAN: r0=412(x1), r1=52(y1), r2=454(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 52
LDI r2, 454
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
