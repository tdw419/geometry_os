; DESCRIPTION: Draws a yellow line from (494, 118) to (359, 90).
; PLAN: r0=494(x1), r1=118(y1), r2=359(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 118
LDI r2, 359
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
