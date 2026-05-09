; DESCRIPTION: Composite: Draws a black circle centered at (159, 99) with radius 79 then Places a red dot at position (239, 143) then Draws a orange rectangle at (474, 64) with width 19 and height 99.
; PLAN: r0=159(x), r1=99(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=239(x), r6=143(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=474(x), r11=64(y), r12=19(width), r13=99(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 159
LDI r1, 99
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 239
LDI r6, 143
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 474
LDI r11, 64
LDI r12, 19
LDI r13, 99
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
