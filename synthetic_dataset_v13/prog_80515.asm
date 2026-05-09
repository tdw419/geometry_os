; DESCRIPTION: Composite: Draws a black circle centered at (329, 164) with radius 49 then Places a black line segment connecting (84, 181) to (82, 224) then Places a magenta 22x86 rectangle at position (229, 100).
; PLAN: r0=329(x), r1=164(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=84(x1), r6=181(y1), r7=82(x2), r8=224(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=229(x), r11=100(y), r12=22(width), r13=86(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 164
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 84
LDI r6, 181
LDI r7, 82
LDI r8, 224
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 229
LDI r11, 100
LDI r12, 22
LDI r13, 86
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
