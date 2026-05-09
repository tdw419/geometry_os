; DESCRIPTION: Draws a purple line from (216, 159) to (58, 102).
; PLAN: r0=216(x1), r1=159(y1), r2=58(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 159
LDI r2, 58
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
