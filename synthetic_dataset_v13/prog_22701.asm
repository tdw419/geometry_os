; DESCRIPTION: Draws a yellow line from (469, 251) to (417, 206).
; PLAN: r0=469(x1), r1=251(y1), r2=417(x2), r3=206(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 251
LDI r2, 417
LDI r3, 206
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
