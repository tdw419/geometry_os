; DESCRIPTION: Draws a yellow line from (431, 246) to (424, 224).
; PLAN: r0=431(x1), r1=246(y1), r2=424(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 246
LDI r2, 424
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
