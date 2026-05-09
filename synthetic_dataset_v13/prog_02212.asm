; DESCRIPTION: Composite: Draws a black rectangle at (215, 72) with width 58 and height 94 then Places a magenta dot at position (482, 183) then Creates a white circular shape at (301, 162) with radius 12.
; PLAN: r0=215(x), r1=72(y), r2=58(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=482(x), r6=183(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=301(x), r11=162(y), r12=12(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 215
LDI r1, 72
LDI r2, 58
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 183
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 301
LDI r11, 162
LDI r12, 12
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
