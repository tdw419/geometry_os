; DESCRIPTION: Composite: Sets a single green pixel at (266, 246) then Creates a green circular shape at (150, 70) with radius 63 then Draws a black rectangle at (312, 139) with width 83 and height 49.
; PLAN: r0=266(x), r1=246(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=150(x), r6=70(y), r7=63(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=312(x), r11=139(y), r12=83(width), r13=49(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 266
LDI r1, 246
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 150
LDI r6, 70
LDI r7, 63
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 312
LDI r11, 139
LDI r12, 83
LDI r13, 49
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
