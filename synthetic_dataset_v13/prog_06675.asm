; DESCRIPTION: Draws a blue line from (359, 177) to (306, 163).
; PLAN: r0=359(x1), r1=177(y1), r2=306(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 177
LDI r2, 306
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
