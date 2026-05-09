; DESCRIPTION: Draws a purple line from (426, 63) to (452, 213).
; PLAN: r0=426(x1), r1=63(y1), r2=452(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 63
LDI r2, 452
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
