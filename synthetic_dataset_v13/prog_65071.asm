; DESCRIPTION: Composite: Creates a purple circular shape at (340, 85) with radius 74 then Places a black dot at position (91, 216) then Draws a magenta rectangle at (278, 9) with width 101 and height 36.
; PLAN: r0=340(x), r1=85(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=91(x), r6=216(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=278(x), r11=9(y), r12=101(width), r13=36(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 340
LDI r1, 85
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 91
LDI r6, 216
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 278
LDI r11, 9
LDI r12, 101
LDI r13, 36
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
