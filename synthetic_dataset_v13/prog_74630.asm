; DESCRIPTION: Composite: Places a purple 44x21 rectangle at position (62, 154) then Draws a black circle centered at (479, 128) with radius 17.
; PLAN: r0=62(x), r1=154(y), r2=44(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=479(x), r6=128(y), r7=17(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 62
LDI r1, 154
LDI r2, 44
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 479
LDI r6, 128
LDI r7, 17
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
