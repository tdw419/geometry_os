; DESCRIPTION: Draws a yellow line from (155, 225) to (511, 101).
; PLAN: r0=155(x1), r1=225(y1), r2=511(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 225
LDI r2, 511
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
