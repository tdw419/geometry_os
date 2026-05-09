; DESCRIPTION: Composite: Creates a magenta circular shape at (287, 143) with radius 57 then Places a black dot at position (19, 32) then Draws a yellow rectangle at (269, 234) with width 82 and height 14.
; PLAN: r0=287(x), r1=143(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=19(x), r6=32(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=269(x), r11=234(y), r12=82(width), r13=14(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 287
LDI r1, 143
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 19
LDI r6, 32
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 269
LDI r11, 234
LDI r12, 82
LDI r13, 14
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
