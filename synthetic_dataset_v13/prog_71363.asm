; DESCRIPTION: Renders a orange line between points (336, 127) and (0, 123).
; PLAN: r0=336(x1), r1=127(y1), r2=0(x2), r3=123(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 127
LDI r2, 0
LDI r3, 123
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
