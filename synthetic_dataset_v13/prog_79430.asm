; DESCRIPTION: Renders a orange line between points (472, 93) and (280, 157).
; PLAN: r0=472(x1), r1=93(y1), r2=280(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 93
LDI r2, 280
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
