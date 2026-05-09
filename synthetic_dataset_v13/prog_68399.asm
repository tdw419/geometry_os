; DESCRIPTION: Draws a yellow line from (339, 97) to (373, 130).
; PLAN: r0=339(x1), r1=97(y1), r2=373(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 97
LDI r2, 373
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
