; DESCRIPTION: Draws a yellow line from (471, 21) to (378, 155).
; PLAN: r0=471(x1), r1=21(y1), r2=378(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 21
LDI r2, 378
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
