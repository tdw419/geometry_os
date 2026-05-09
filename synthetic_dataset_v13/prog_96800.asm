; DESCRIPTION: Draws a black line from (93, 71) to (318, 185).
; PLAN: r0=93(x1), r1=71(y1), r2=318(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 71
LDI r2, 318
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
