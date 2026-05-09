; DESCRIPTION: Composite: Draws a white rectangle at (257, 86) with width 18 and height 85 then Places a blue circle of radius 35 at center (171, 183) then Places a yellow dot at position (91, 218).
; PLAN: r0=257(x), r1=86(y), r2=18(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=171(x), r6=183(y), r7=35(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=91(x), r11=218(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 257
LDI r1, 86
LDI r2, 18
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 183
LDI r7, 35
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 91
LDI r11, 218
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
