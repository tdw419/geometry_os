; DESCRIPTION: Draws a yellow line from (427, 11) to (37, 126).
; PLAN: r0=427(x1), r1=11(y1), r2=37(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 11
LDI r2, 37
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
