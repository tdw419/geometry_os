; DESCRIPTION: Composite: Places a green dot at position (111, 255) then Places a yellow circle of radius 78 at center (184, 130) then Draws a magenta rectangle at (379, 196) with width 96 and height 35.
; PLAN: r0=111(x), r1=255(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=184(x), r6=130(y), r7=78(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=379(x), r11=196(y), r12=96(width), r13=35(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 111
LDI r1, 255
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 184
LDI r6, 130
LDI r7, 78
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 379
LDI r11, 196
LDI r12, 96
LDI r13, 35
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
