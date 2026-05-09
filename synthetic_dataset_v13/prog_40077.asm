; DESCRIPTION: Draws a purple line from (238, 113) to (139, 138).
; PLAN: r0=238(x1), r1=113(y1), r2=139(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 113
LDI r2, 139
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
