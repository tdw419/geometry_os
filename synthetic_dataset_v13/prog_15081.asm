; DESCRIPTION: Draws a blue line from (185, 189) to (246, 96).
; PLAN: r0=185(x1), r1=189(y1), r2=246(x2), r3=96(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 189
LDI r2, 246
LDI r3, 96
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
