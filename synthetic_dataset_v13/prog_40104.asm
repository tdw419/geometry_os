; DESCRIPTION: Draws a green line from (192, 30) to (282, 156).
; PLAN: r0=192(x1), r1=30(y1), r2=282(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 30
LDI r2, 282
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
