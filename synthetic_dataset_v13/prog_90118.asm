; DESCRIPTION: Draws a purple line from (362, 98) to (359, 64).
; PLAN: r0=362(x1), r1=98(y1), r2=359(x2), r3=64(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 98
LDI r2, 359
LDI r3, 64
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
