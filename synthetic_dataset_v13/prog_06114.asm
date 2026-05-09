; DESCRIPTION: Renders a orange line between points (249, 195) and (153, 93).
; PLAN: r0=249(x1), r1=195(y1), r2=153(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 195
LDI r2, 153
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
