; DESCRIPTION: Composite: Draws a white line from (344, 255) to (239, 89) then Places a magenta circle of radius 32 at center (316, 99) then Renders a white box of size 88x67 starting at (192, 185).
; PLAN: r0=344(x1), r1=255(y1), r2=239(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=99(y), r7=32(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=192(x), r11=185(y), r12=88(width), r13=67(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 255
LDI r2, 239
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 99
LDI r7, 32
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 192
LDI r11, 185
LDI r12, 88
LDI r13, 67
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
