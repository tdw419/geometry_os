; DESCRIPTION: Renders a orange line between points (304, 25) and (161, 93).
; PLAN: r0=304(x1), r1=25(y1), r2=161(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 25
LDI r2, 161
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
