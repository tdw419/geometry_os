; DESCRIPTION: Draws a blue line from (284, 81) to (490, 44).
; PLAN: r0=284(x1), r1=81(y1), r2=490(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 81
LDI r2, 490
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
