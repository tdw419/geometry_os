; DESCRIPTION: Composite: Draws a red circle centered at (248, 155) with radius 49 then Places a magenta dot at position (47, 75) then Draws a black rectangle at (309, 28) with width 19 and height 28.
; PLAN: r0=248(x), r1=155(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=47(x), r6=75(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=309(x), r11=28(y), r12=19(width), r13=28(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 248
LDI r1, 155
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 47
LDI r6, 75
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 309
LDI r11, 28
LDI r12, 19
LDI r13, 28
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
