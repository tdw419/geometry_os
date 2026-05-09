; DESCRIPTION: Composite: Places a magenta line segment connecting (373, 224) to (337, 122) then Draws a green circle centered at (425, 200) with radius 40 then Places a yellow 26x83 rectangle at position (151, 40).
; PLAN: r0=373(x1), r1=224(y1), r2=337(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=425(x), r6=200(y), r7=40(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=151(x), r11=40(y), r12=26(width), r13=83(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 373
LDI r1, 224
LDI r2, 337
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 200
LDI r7, 40
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 151
LDI r11, 40
LDI r12, 26
LDI r13, 83
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
