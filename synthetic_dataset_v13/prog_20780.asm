; DESCRIPTION: Draws a black line from (156, 213) to (101, 147).
; PLAN: r0=156(x1), r1=213(y1), r2=101(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 213
LDI r2, 101
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
