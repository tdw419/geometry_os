; DESCRIPTION: Places a black line segment connecting (278, 112) to (246, 176).
; PLAN: r0=278(x1), r1=112(y1), r2=246(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 112
LDI r2, 246
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
