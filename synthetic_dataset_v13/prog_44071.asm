; DESCRIPTION: Renders a orange line between points (93, 121) and (110, 204).
; PLAN: r0=93(x1), r1=121(y1), r2=110(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 121
LDI r2, 110
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
