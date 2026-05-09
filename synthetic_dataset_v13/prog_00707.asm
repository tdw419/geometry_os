; DESCRIPTION: Composite: Creates a white rectangular region at (341, 35) spanning 32 by 71 pixels then Draws a yellow circle centered at (72, 80) with radius 39 then Places a white dot at position (284, 251).
; PLAN: r0=341(x), r1=35(y), r2=32(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=72(x), r6=80(y), r7=39(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=284(x), r11=251(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 341
LDI r1, 35
LDI r2, 32
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 80
LDI r7, 39
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 284
LDI r11, 251
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
