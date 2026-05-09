; DESCRIPTION: Draws a blue line from (379, 212) to (263, 102).
; PLAN: r0=379(x1), r1=212(y1), r2=263(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 212
LDI r2, 263
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
