; DESCRIPTION: Draws a yellow line from (147, 37) to (220, 128).
; PLAN: r0=147(x1), r1=37(y1), r2=220(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 37
LDI r2, 220
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
