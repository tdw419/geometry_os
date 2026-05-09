; DESCRIPTION: Composite: Draws a yellow rectangle at (240, 29) with width 80 and height 88 then Creates a white circular shape at (441, 104) with radius 61 then Sets a single purple pixel at (45, 47).
; PLAN: r0=240(x), r1=29(y), r2=80(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=441(x), r6=104(y), r7=61(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=45(x), r11=47(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 240
LDI r1, 29
LDI r2, 80
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 104
LDI r7, 61
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 45
LDI r11, 47
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
