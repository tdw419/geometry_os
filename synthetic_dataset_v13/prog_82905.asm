; DESCRIPTION: Draws a yellow line from (159, 176) to (311, 217).
; PLAN: r0=159(x1), r1=176(y1), r2=311(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 176
LDI r2, 311
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
