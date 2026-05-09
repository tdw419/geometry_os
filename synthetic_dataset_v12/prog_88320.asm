; DESCRIPTION: Places a yellow line segment connecting (278, 109) to (107, 176).
; PLAN: r0=278(x1), r1=109(y1), r2=107(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 109
LDI r2, 107
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
