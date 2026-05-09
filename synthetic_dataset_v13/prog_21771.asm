; DESCRIPTION: Draws a yellow line from (136, 126) to (49, 201).
; PLAN: r0=136(x1), r1=126(y1), r2=49(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 126
LDI r2, 49
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
