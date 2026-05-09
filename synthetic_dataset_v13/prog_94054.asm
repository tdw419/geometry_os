; DESCRIPTION: Composite: Creates a green circular shape at (176, 144) with radius 55 then Draws a white rectangle at (289, 83) with width 19 and height 53 then Sets a single white pixel at (472, 149).
; PLAN: r0=176(x), r1=144(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=289(x), r6=83(y), r7=19(width), r8=53(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=472(x), r11=149(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 176
LDI r1, 144
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 289
LDI r6, 83
LDI r7, 19
LDI r8, 53
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 472
LDI r11, 149
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
