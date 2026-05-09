; DESCRIPTION: Draws a purple line from (449, 240) to (183, 37).
; PLAN: r0=449(x1), r1=240(y1), r2=183(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 240
LDI r2, 183
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
