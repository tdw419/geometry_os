; DESCRIPTION: Draws a purple line from (128, 132) to (283, 139).
; PLAN: r0=128(x1), r1=132(y1), r2=283(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 132
LDI r2, 283
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
