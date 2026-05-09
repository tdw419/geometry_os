; DESCRIPTION: Draws a blue line from (1, 246) to (267, 64).
; PLAN: r0=1(x1), r1=246(y1), r2=267(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 246
LDI r2, 267
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
