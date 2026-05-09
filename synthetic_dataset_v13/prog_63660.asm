; DESCRIPTION: Draws a yellow line from (324, 17) to (27, 147).
; PLAN: r0=324(x1), r1=17(y1), r2=27(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 17
LDI r2, 27
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
