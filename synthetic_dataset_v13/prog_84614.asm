; DESCRIPTION: Places a white line segment connecting (128, 147) to (358, 90).
; PLAN: r0=128(x1), r1=147(y1), r2=358(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 147
LDI r2, 358
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
