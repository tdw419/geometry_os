; DESCRIPTION: Composite: Places a orange circle of radius 17 at center (424, 94) then Sets a single white pixel at (173, 136) then Draws a white rectangle at (238, 98) with width 67 and height 25.
; PLAN: r0=424(x), r1=94(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=173(x), r6=136(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=238(x), r11=98(y), r12=67(width), r13=25(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 94
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 173
LDI r6, 136
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 238
LDI r11, 98
LDI r12, 67
LDI r13, 25
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
