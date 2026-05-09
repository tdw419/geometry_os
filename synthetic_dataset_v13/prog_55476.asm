; DESCRIPTION: Composite: Renders a green box of size 94x38 starting at (93, 207) then Draws a blue line from (406, 74) to (314, 170) then Renders a blue disk with center (74, 46) and radius 24.
; PLAN: r0=93(x), r1=207(y), r2=94(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=406(x1), r6=74(y1), r7=314(x2), r8=170(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=74(x), r11=46(y), r12=24(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 93
LDI r1, 207
LDI r2, 94
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 74
LDI r7, 314
LDI r8, 170
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 74
LDI r11, 46
LDI r12, 24
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
