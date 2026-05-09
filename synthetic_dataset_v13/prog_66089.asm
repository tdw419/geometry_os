; DESCRIPTION: Composite: Draws a blue rectangle at (461, 86) with width 45 and height 68 then Creates a green circular shape at (357, 174) with radius 18 then Places a white dot at position (439, 74).
; PLAN: r0=461(x), r1=86(y), r2=45(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=357(x), r6=174(y), r7=18(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=439(x), r11=74(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 461
LDI r1, 86
LDI r2, 45
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 174
LDI r7, 18
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 439
LDI r11, 74
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
