; DESCRIPTION: Draws a blue line from (284, 26) to (490, 232).
; PLAN: r0=284(x1), r1=26(y1), r2=490(x2), r3=232(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 26
LDI r2, 490
LDI r3, 232
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
