; DESCRIPTION: Composite: Sets a single white pixel at (222, 50) then Draws a blue rectangle at (384, 83) with width 10 and height 61 then Draws a magenta circle centered at (332, 67) with radius 62.
; PLAN: r0=222(x), r1=50(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=384(x), r6=83(y), r7=10(width), r8=61(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=332(x), r11=67(y), r12=62(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 222
LDI r1, 50
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 384
LDI r6, 83
LDI r7, 10
LDI r8, 61
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 332
LDI r11, 67
LDI r12, 62
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
