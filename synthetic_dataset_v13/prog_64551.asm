; DESCRIPTION: Composite: Draws a blue rectangle at (294, 78) with width 50 and height 25 then Draws a white circle centered at (304, 15) with radius 12 then Sets a single magenta pixel at (4, 50).
; PLAN: r0=294(x), r1=78(y), r2=50(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=304(x), r6=15(y), r7=12(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=4(x), r11=50(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 294
LDI r1, 78
LDI r2, 50
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 15
LDI r7, 12
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 4
LDI r11, 50
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
