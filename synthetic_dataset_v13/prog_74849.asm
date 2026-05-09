; DESCRIPTION: Renders a orange line between points (182, 153) and (497, 142).
; PLAN: r0=182(x1), r1=153(y1), r2=497(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 153
LDI r2, 497
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
