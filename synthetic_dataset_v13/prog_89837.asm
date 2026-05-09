; DESCRIPTION: Draws a purple line from (307, 31) to (64, 11).
; PLAN: r0=307(x1), r1=31(y1), r2=64(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 31
LDI r2, 64
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
