; DESCRIPTION: Draws a purple line from (1, 58) to (407, 167).
; PLAN: r0=1(x1), r1=58(y1), r2=407(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 58
LDI r2, 407
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
