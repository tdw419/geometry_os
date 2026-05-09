; DESCRIPTION: Renders a orange line between points (142, 178) and (131, 148).
; PLAN: r0=142(x1), r1=178(y1), r2=131(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 178
LDI r2, 131
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
