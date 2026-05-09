; DESCRIPTION: Composite: Draws a yellow line from (363, 7) to (307, 36) then Renders a green box of size 29x48 starting at (154, 155) then Draws a black circle centered at (343, 200) with radius 45.
; PLAN: r0=363(x1), r1=7(y1), r2=307(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=154(x), r6=155(y), r7=29(width), r8=48(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=343(x), r11=200(y), r12=45(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 363
LDI r1, 7
LDI r2, 307
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 155
LDI r7, 29
LDI r8, 48
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 343
LDI r11, 200
LDI r12, 45
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
