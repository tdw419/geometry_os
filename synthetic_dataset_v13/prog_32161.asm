; DESCRIPTION: Draws a green line from (362, 144) to (190, 147).
; PLAN: r0=362(x1), r1=144(y1), r2=190(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 144
LDI r2, 190
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
