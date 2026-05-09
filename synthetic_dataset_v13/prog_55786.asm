; DESCRIPTION: Composite: Draws a magenta rectangle at (375, 189) with width 53 and height 63 then Places a purple circle of radius 59 at center (239, 137).
; PLAN: r0=375(x), r1=189(y), r2=53(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=239(x), r6=137(y), r7=59(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 375
LDI r1, 189
LDI r2, 53
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 137
LDI r7, 59
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
