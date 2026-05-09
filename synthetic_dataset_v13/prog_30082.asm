; DESCRIPTION: Composite: Places a black 34x36 rectangle at position (417, 34) then Renders a magenta line between points (400, 170) and (400, 150) then Draws a magenta circle centered at (258, 71) with radius 39.
; PLAN: r0=417(x), r1=34(y), r2=34(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x1), r6=170(y1), r7=400(x2), r8=150(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=258(x), r11=71(y), r12=39(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 417
LDI r1, 34
LDI r2, 34
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 170
LDI r7, 400
LDI r8, 150
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 258
LDI r11, 71
LDI r12, 39
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
