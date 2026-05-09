; DESCRIPTION: Composite: Creates a yellow circular shape at (231, 114) with radius 62 then Draws a purple line from (390, 148) to (123, 236).
; PLAN: r0=231(x), r1=114(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=390(x1), r6=148(y1), r7=123(x2), r8=236(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 231
LDI r1, 114
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 390
LDI r6, 148
LDI r7, 123
LDI r8, 236
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
