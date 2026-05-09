; DESCRIPTION: Draws a purple line from (447, 37) to (126, 140).
; PLAN: r0=447(x1), r1=37(y1), r2=126(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 37
LDI r2, 126
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
