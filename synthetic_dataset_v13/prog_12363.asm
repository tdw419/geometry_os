; DESCRIPTION: Composite: Draws a purple rectangle at (142, 61) with width 74 and height 101 then Sets a single purple pixel at (499, 224) then Places a magenta circle of radius 45 at center (439, 151).
; PLAN: r0=142(x), r1=61(y), r2=74(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=499(x), r6=224(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=439(x), r11=151(y), r12=45(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 142
LDI r1, 61
LDI r2, 74
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 499
LDI r6, 224
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 439
LDI r11, 151
LDI r12, 45
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
