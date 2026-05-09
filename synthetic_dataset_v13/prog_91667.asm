; DESCRIPTION: Draws a purple line from (165, 77) to (379, 65).
; PLAN: r0=165(x1), r1=77(y1), r2=379(x2), r3=65(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 77
LDI r2, 379
LDI r3, 65
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
