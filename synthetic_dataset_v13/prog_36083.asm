; DESCRIPTION: Draws a blue line from (379, 186) to (436, 48).
; PLAN: r0=379(x1), r1=186(y1), r2=436(x2), r3=48(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 186
LDI r2, 436
LDI r3, 48
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
