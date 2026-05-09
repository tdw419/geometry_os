; DESCRIPTION: Composite: Creates a cyan circular shape at (94, 181) with radius 67 then Draws a magenta rectangle at (246, 99) with width 71 and height 26 then Renders a magenta line between points (111, 192) and (123, 245).
; PLAN: r0=94(x), r1=181(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=246(x), r6=99(y), r7=71(width), r8=26(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=111(x1), r11=192(y1), r12=123(x2), r13=245(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 94
LDI r1, 181
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 246
LDI r6, 99
LDI r7, 71
LDI r8, 26
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 192
LDI r12, 123
LDI r13, 245
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
