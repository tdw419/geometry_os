; DESCRIPTION: Composite: Draws a red circle centered at (58, 40) with radius 27 then Places a orange line segment connecting (173, 47) to (144, 224) then Places a black 73x55 rectangle at position (2, 195).
; PLAN: r0=58(x), r1=40(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=173(x1), r6=47(y1), r7=144(x2), r8=224(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=2(x), r11=195(y), r12=73(width), r13=55(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 58
LDI r1, 40
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 173
LDI r6, 47
LDI r7, 144
LDI r8, 224
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 2
LDI r11, 195
LDI r12, 73
LDI r13, 55
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
