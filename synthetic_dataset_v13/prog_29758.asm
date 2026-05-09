; DESCRIPTION: Draws a black line from (379, 230) to (349, 100).
; PLAN: r0=379(x1), r1=230(y1), r2=349(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 230
LDI r2, 349
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
