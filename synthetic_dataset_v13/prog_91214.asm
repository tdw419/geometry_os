; DESCRIPTION: Draws a yellow line from (276, 102) to (246, 224).
; PLAN: r0=276(x1), r1=102(y1), r2=246(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 102
LDI r2, 246
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
