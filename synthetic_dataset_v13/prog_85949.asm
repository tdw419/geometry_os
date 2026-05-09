; DESCRIPTION: Draws a purple line from (182, 63) to (362, 40).
; PLAN: r0=182(x1), r1=63(y1), r2=362(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 63
LDI r2, 362
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
