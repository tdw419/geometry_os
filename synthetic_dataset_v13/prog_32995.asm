; DESCRIPTION: Composite: Places a magenta dot at position (225, 163) then Places a orange circle of radius 13 at center (289, 19) then Draws a white rectangle at (310, 0) with width 97 and height 31.
; PLAN: r0=225(x), r1=163(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=289(x), r6=19(y), r7=13(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=310(x), r11=0(y), r12=97(width), r13=31(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 225
LDI r1, 163
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 289
LDI r6, 19
LDI r7, 13
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 310
LDI r11, 0
LDI r12, 97
LDI r13, 31
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
