; DESCRIPTION: Draws a blue line from (144, 112) to (327, 53).
; PLAN: r0=144(x1), r1=112(y1), r2=327(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 112
LDI r2, 327
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
