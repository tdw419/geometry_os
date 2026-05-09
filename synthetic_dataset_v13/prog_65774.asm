; DESCRIPTION: Draws a purple line from (3, 134) to (101, 167).
; PLAN: r0=3(x1), r1=134(y1), r2=101(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 134
LDI r2, 101
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
