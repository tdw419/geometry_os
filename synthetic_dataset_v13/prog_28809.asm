; DESCRIPTION: Draws a purple line from (149, 247) to (292, 245).
; PLAN: r0=149(x1), r1=247(y1), r2=292(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 247
LDI r2, 292
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
