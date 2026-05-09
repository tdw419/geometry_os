; DESCRIPTION: Draws a green line from (235, 147) to (212, 224).
; PLAN: r0=235(x1), r1=147(y1), r2=212(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 147
LDI r2, 212
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
