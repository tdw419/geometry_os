; DESCRIPTION: Composite: Draws a purple line from (337, 10) to (462, 176) then Creates a yellow rectangular region at (53, 26) spanning 97 by 18 pixels.
; PLAN: r0=337(x1), r1=10(y1), r2=462(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=53(x), r6=26(y), r7=97(width), r8=18(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 10
LDI r2, 462
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 26
LDI r7, 97
LDI r8, 18
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
