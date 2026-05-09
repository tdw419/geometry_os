; DESCRIPTION: Draws a purple line from (72, 32) to (32, 182).
; PLAN: r0=72(x1), r1=32(y1), r2=32(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 32
LDI r2, 32
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
