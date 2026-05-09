; DESCRIPTION: Composite: Draws a black circle centered at (53, 60) with radius 40 then Places a green 60x108 rectangle at position (256, 43).
; PLAN: r0=53(x), r1=60(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=256(x), r6=43(y), r7=60(width), r8=108(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 53
LDI r1, 60
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 256
LDI r6, 43
LDI r7, 60
LDI r8, 108
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
