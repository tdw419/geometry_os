; DESCRIPTION: Places a purple line segment connecting (361, 206) to (136, 126).
; PLAN: r0=361(x1), r1=206(y1), r2=136(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 206
LDI r2, 136
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
