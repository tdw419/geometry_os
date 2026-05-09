; DESCRIPTION: Draws a blue line from (212, 166) to (396, 122).
; PLAN: r0=212(x1), r1=166(y1), r2=396(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 166
LDI r2, 396
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
