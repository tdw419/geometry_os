; DESCRIPTION: Composite: Creates a white circular shape at (14, 218) with radius 13 then Draws a purple rectangle at (375, 88) with width 60 and height 68 then Sets a single orange pixel at (257, 128).
; PLAN: r0=14(x), r1=218(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=375(x), r6=88(y), r7=60(width), r8=68(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=257(x), r11=128(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 14
LDI r1, 218
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 375
LDI r6, 88
LDI r7, 60
LDI r8, 68
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 257
LDI r11, 128
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
