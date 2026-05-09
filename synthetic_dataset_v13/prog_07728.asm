; DESCRIPTION: Draws a black line from (255, 94) to (379, 185).
; PLAN: r0=255(x1), r1=94(y1), r2=379(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 94
LDI r2, 379
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
