; DESCRIPTION: Draws a green line from (15, 56) to (351, 254).
; PLAN: r0=15(x1), r1=56(y1), r2=351(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 56
LDI r2, 351
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
