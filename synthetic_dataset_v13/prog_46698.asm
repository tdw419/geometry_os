; DESCRIPTION: Draws a yellow line from (241, 230) to (471, 101).
; PLAN: r0=241(x1), r1=230(y1), r2=471(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 230
LDI r2, 471
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
