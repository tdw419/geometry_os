; DESCRIPTION: Draws a yellow line from (189, 87) to (351, 50).
; PLAN: r0=189(x1), r1=87(y1), r2=351(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 87
LDI r2, 351
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
