; DESCRIPTION: Draws a blue line from (497, 223) to (351, 21).
; PLAN: r0=497(x1), r1=223(y1), r2=351(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 223
LDI r2, 351
LDI r3, 21
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
