; DESCRIPTION: Draws a blue line from (483, 151) to (155, 222).
; PLAN: r0=483(x1), r1=151(y1), r2=155(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 151
LDI r2, 155
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
