; DESCRIPTION: Draws a blue line from (344, 20) to (379, 82).
; PLAN: r0=344(x1), r1=20(y1), r2=379(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 20
LDI r2, 379
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
