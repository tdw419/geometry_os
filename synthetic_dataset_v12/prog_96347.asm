; DESCRIPTION: Renders a orange line between points (88, 139) and (262, 101).
; PLAN: r0=88(x1), r1=139(y1), r2=262(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 139
LDI r2, 262
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
