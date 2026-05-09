; DESCRIPTION: Draws a yellow line from (451, 182) to (26, 119).
; PLAN: r0=451(x1), r1=182(y1), r2=26(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 182
LDI r2, 26
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
