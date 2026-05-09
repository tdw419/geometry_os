; DESCRIPTION: Draws a yellow line from (235, 192) to (375, 245).
; PLAN: r0=235(x1), r1=192(y1), r2=375(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 192
LDI r2, 375
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
