; DESCRIPTION: Draws a purple line from (406, 64) to (459, 195).
; PLAN: r0=406(x1), r1=64(y1), r2=459(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 64
LDI r2, 459
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
