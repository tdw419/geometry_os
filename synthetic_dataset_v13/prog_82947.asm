; DESCRIPTION: Draws a blue line from (183, 37) to (379, 136).
; PLAN: r0=183(x1), r1=37(y1), r2=379(x2), r3=136(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 37
LDI r2, 379
LDI r3, 136
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
