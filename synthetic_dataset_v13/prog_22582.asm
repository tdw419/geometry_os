; DESCRIPTION: Draws a blue line from (456, 112) to (337, 183).
; PLAN: r0=456(x1), r1=112(y1), r2=337(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 112
LDI r2, 337
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
