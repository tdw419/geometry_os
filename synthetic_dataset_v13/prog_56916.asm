; DESCRIPTION: Composite: Draws a yellow rectangle at (174, 82) with width 88 and height 32 then Creates a orange circular shape at (317, 109) with radius 42 then Sets a single green pixel at (407, 3).
; PLAN: r0=174(x), r1=82(y), r2=88(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=317(x), r6=109(y), r7=42(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=407(x), r11=3(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 174
LDI r1, 82
LDI r2, 88
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 109
LDI r7, 42
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 407
LDI r11, 3
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
