; DESCRIPTION: Draws a yellow line from (318, 26) to (419, 93).
; PLAN: r0=318(x1), r1=26(y1), r2=419(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 26
LDI r2, 419
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
