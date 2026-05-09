; DESCRIPTION: Composite: Sets a single blue pixel at (350, 221) then Places a green circle of radius 65 at center (72, 183) then Draws a yellow rectangle at (68, 64) with width 65 and height 80.
; PLAN: r0=350(x), r1=221(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=72(x), r6=183(y), r7=65(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=68(x), r11=64(y), r12=65(width), r13=80(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 350
LDI r1, 221
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 72
LDI r6, 183
LDI r7, 65
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 68
LDI r11, 64
LDI r12, 65
LDI r13, 80
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
