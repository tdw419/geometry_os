; DESCRIPTION: Composite: Draws a green line from (245, 59) to (249, 224) then Renders a red box of size 63x36 starting at (184, 139) then Creates a yellow circular shape at (75, 155) with radius 15.
; PLAN: r0=245(x1), r1=59(y1), r2=249(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=184(x), r6=139(y), r7=63(width), r8=36(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=75(x), r11=155(y), r12=15(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 245
LDI r1, 59
LDI r2, 249
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 139
LDI r7, 63
LDI r8, 36
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 75
LDI r11, 155
LDI r12, 15
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
