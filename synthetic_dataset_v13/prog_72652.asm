; DESCRIPTION: Draws a purple line from (25, 197) to (32, 88).
; PLAN: r0=25(x1), r1=197(y1), r2=32(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 197
LDI r2, 32
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
