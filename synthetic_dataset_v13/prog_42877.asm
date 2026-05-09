; DESCRIPTION: Draws a purple line from (327, 119) to (440, 67).
; PLAN: r0=327(x1), r1=119(y1), r2=440(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 119
LDI r2, 440
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
