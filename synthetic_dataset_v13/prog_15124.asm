; DESCRIPTION: Composite: Places a magenta circle of radius 23 at center (415, 212) then Draws a black rectangle at (310, 102) with width 54 and height 62 then Sets a single black pixel at (172, 254).
; PLAN: r0=415(x), r1=212(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=310(x), r6=102(y), r7=54(width), r8=62(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=172(x), r11=254(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 415
LDI r1, 212
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 310
LDI r6, 102
LDI r7, 54
LDI r8, 62
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 254
LDI r12, 0x000000
PSET r10, r11, r12
HALT
