; DESCRIPTION: Composite: Renders a red box of size 10x12 starting at (460, 94) then Draws a magenta line from (30, 62) to (390, 120) then Creates a yellow circular shape at (327, 170) with radius 67.
; PLAN: r0=460(x), r1=94(y), r2=10(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=30(x1), r6=62(y1), r7=390(x2), r8=120(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=327(x), r11=170(y), r12=67(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 460
LDI r1, 94
LDI r2, 10
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 30
LDI r6, 62
LDI r7, 390
LDI r8, 120
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 327
LDI r11, 170
LDI r12, 67
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
