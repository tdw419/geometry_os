; DESCRIPTION: Draws a purple line from (452, 178) to (258, 53).
; PLAN: r0=452(x1), r1=178(y1), r2=258(x2), r3=53(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 178
LDI r2, 258
LDI r3, 53
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
