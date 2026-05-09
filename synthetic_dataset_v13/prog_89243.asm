; DESCRIPTION: Draws a purple line from (493, 253) to (454, 50).
; PLAN: r0=493(x1), r1=253(y1), r2=454(x2), r3=50(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 253
LDI r2, 454
LDI r3, 50
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
