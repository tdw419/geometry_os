; DESCRIPTION: Composite: Places a yellow dot at position (68, 8) then Draws a white circle centered at (285, 185) with radius 53 then Draws a green rectangle at (361, 32) with width 68 and height 22.
; PLAN: r0=68(x), r1=8(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=285(x), r6=185(y), r7=53(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=361(x), r11=32(y), r12=68(width), r13=22(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 68
LDI r1, 8
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 285
LDI r6, 185
LDI r7, 53
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 361
LDI r11, 32
LDI r12, 68
LDI r13, 22
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
