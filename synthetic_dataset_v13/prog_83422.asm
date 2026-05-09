; DESCRIPTION: Composite: Draws a green rectangle at (402, 20) with width 29 and height 53 then Creates a white circular shape at (104, 119) with radius 32 then Sets a single white pixel at (147, 190).
; PLAN: r0=402(x), r1=20(y), r2=29(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=104(x), r6=119(y), r7=32(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=147(x), r11=190(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 402
LDI r1, 20
LDI r2, 29
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 119
LDI r7, 32
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 147
LDI r11, 190
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
