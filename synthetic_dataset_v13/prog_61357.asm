; DESCRIPTION: Draws a white line from (40, 251) to (325, 116).
; PLAN: r0=40(x1), r1=251(y1), r2=325(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 251
LDI r2, 325
LDI r3, 116
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
