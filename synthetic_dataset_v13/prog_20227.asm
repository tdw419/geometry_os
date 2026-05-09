; DESCRIPTION: Composite: Sets a single cyan pixel at (179, 59) then Places a black circle of radius 59 at center (80, 130) then Draws a magenta rectangle at (58, 139) with width 53 and height 49.
; PLAN: r0=179(x), r1=59(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=80(x), r6=130(y), r7=59(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=58(x), r11=139(y), r12=53(width), r13=49(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 59
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 80
LDI r6, 130
LDI r7, 59
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 58
LDI r11, 139
LDI r12, 53
LDI r13, 49
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
