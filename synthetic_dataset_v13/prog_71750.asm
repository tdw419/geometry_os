; DESCRIPTION: Draws a purple line from (377, 63) to (342, 189).
; PLAN: r0=377(x1), r1=63(y1), r2=342(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 63
LDI r2, 342
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
