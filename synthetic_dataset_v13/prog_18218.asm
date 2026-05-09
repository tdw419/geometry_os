; DESCRIPTION: Draws a purple line from (267, 110) to (0, 32).
; PLAN: r0=267(x1), r1=110(y1), r2=0(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 110
LDI r2, 0
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
