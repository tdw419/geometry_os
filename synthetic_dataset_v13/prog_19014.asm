; DESCRIPTION: Renders a orange line between points (396, 74) and (304, 196).
; PLAN: r0=396(x1), r1=74(y1), r2=304(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 74
LDI r2, 304
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
