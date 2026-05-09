; DESCRIPTION: Draws a yellow line from (116, 253) to (128, 147).
; PLAN: r0=116(x1), r1=253(y1), r2=128(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 253
LDI r2, 128
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
