; DESCRIPTION: Composite: Draws a black rectangle at (60, 94) with width 44 and height 97 then Places a white circle of radius 17 at center (280, 183) then Places a blue dot at position (62, 212).
; PLAN: r0=60(x), r1=94(y), r2=44(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=183(y), r7=17(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=62(x), r11=212(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 60
LDI r1, 94
LDI r2, 44
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 183
LDI r7, 17
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 62
LDI r11, 212
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
