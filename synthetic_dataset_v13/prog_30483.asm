; DESCRIPTION: Composite: Renders a green line between points (364, 27) and (486, 99) then Renders a magenta disk with center (116, 219) and radius 17 then Renders a blue box of size 72x103 starting at (339, 147).
; PLAN: r0=364(x1), r1=27(y1), r2=486(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=116(x), r6=219(y), r7=17(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=339(x), r11=147(y), r12=72(width), r13=103(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 27
LDI r2, 486
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 219
LDI r7, 17
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 339
LDI r11, 147
LDI r12, 72
LDI r13, 103
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
