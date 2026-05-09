; DESCRIPTION: Renders a orange line between points (461, 248) and (179, 155).
; PLAN: r0=461(x1), r1=248(y1), r2=179(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 248
LDI r2, 179
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
