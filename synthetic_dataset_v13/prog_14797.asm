; DESCRIPTION: Renders a orange line between points (88, 60) and (306, 102).
; PLAN: r0=88(x1), r1=60(y1), r2=306(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 60
LDI r2, 306
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
