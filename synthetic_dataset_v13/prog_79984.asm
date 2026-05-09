; DESCRIPTION: Draws a green line from (368, 166) to (307, 147).
; PLAN: r0=368(x1), r1=166(y1), r2=307(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 166
LDI r2, 307
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
