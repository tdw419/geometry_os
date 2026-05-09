; DESCRIPTION: Composite: Draws a yellow circle centered at (164, 68) with radius 18 then Sets a single green pixel at (56, 20) then Places a white 110x72 rectangle at position (68, 17).
; PLAN: r0=164(x), r1=68(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=56(x), r6=20(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=68(x), r11=17(y), r12=110(width), r13=72(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 164
LDI r1, 68
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 56
LDI r6, 20
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 68
LDI r11, 17
LDI r12, 110
LDI r13, 72
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
