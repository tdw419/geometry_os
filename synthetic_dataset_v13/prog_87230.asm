; DESCRIPTION: Draws a black line from (93, 245) to (93, 230).
; PLAN: r0=93(x1), r1=245(y1), r2=93(x2), r3=230(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 245
LDI r2, 93
LDI r3, 230
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
