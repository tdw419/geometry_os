; DESCRIPTION: Draws a purple line from (330, 252) to (55, 238).
; PLAN: r0=330(x1), r1=252(y1), r2=55(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 252
LDI r2, 55
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
