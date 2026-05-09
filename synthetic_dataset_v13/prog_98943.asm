; DESCRIPTION: Renders a orange line between points (262, 3) and (123, 163).
; PLAN: r0=262(x1), r1=3(y1), r2=123(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 3
LDI r2, 123
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
