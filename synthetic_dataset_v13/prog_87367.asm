; DESCRIPTION: Draws a purple line from (15, 63) to (383, 125).
; PLAN: r0=15(x1), r1=63(y1), r2=383(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 63
LDI r2, 383
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
