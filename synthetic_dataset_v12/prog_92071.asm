; DESCRIPTION: Draws a yellow line from (364, 156) to (492, 156).
; PLAN: r0=364(x1), r1=156(y1), r2=492(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 156
LDI r2, 492
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
