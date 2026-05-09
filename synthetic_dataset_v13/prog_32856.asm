; DESCRIPTION: Draws a purple line from (274, 99) to (64, 233).
; PLAN: r0=274(x1), r1=99(y1), r2=64(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 99
LDI r2, 64
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
