; DESCRIPTION: Draws a blue line from (453, 156) to (226, 73).
; PLAN: r0=453(x1), r1=156(y1), r2=226(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 156
LDI r2, 226
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
