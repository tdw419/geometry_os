; DESCRIPTION: Draws a black line from (477, 151) to (37, 232).
; PLAN: r0=477(x1), r1=151(y1), r2=37(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 151
LDI r2, 37
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
