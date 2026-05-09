; DESCRIPTION: Renders a orange line between points (80, 101) and (457, 164).
; PLAN: r0=80(x1), r1=101(y1), r2=457(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 101
LDI r2, 457
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
