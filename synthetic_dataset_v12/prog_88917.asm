; DESCRIPTION: Draws a purple line from (326, 214) to (74, 217).
; PLAN: r0=326(x1), r1=214(y1), r2=74(x2), r3=217(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 214
LDI r2, 74
LDI r3, 217
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
