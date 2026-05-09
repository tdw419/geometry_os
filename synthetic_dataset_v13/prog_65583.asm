; DESCRIPTION: Renders a orange line between points (93, 178) and (417, 7).
; PLAN: r0=93(x1), r1=178(y1), r2=417(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 178
LDI r2, 417
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
