; DESCRIPTION: Draws a purple line from (490, 215) to (173, 13).
; PLAN: r0=490(x1), r1=215(y1), r2=173(x2), r3=13(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 215
LDI r2, 173
LDI r3, 13
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
