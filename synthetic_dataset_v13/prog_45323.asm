; DESCRIPTION: Draws a purple line from (34, 98) to (139, 129).
; PLAN: r0=34(x1), r1=98(y1), r2=139(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 98
LDI r2, 139
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
