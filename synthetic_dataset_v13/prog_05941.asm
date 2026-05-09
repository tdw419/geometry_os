; DESCRIPTION: Composite: Draws a blue circle centered at (151, 96) with radius 12 then Places a yellow dot at position (107, 173) then Draws a yellow rectangle at (64, 68) with width 26 and height 94.
; PLAN: r0=151(x), r1=96(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=107(x), r6=173(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=64(x), r11=68(y), r12=26(width), r13=94(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 151
LDI r1, 96
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 107
LDI r6, 173
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 64
LDI r11, 68
LDI r12, 26
LDI r13, 94
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
