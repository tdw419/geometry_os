; DESCRIPTION: Composite: Draws a blue rectangle at (197, 176) with width 23 and height 42 then Places a green dot at position (469, 86) then Creates a yellow circular shape at (373, 92) with radius 36.
; PLAN: r0=197(x), r1=176(y), r2=23(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=469(x), r6=86(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=373(x), r11=92(y), r12=36(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 197
LDI r1, 176
LDI r2, 23
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 86
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 373
LDI r11, 92
LDI r12, 36
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
