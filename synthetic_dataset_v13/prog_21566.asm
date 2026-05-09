; DESCRIPTION: Renders a orange line between points (188, 247) and (102, 53).
; PLAN: r0=188(x1), r1=247(y1), r2=102(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 247
LDI r2, 102
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
