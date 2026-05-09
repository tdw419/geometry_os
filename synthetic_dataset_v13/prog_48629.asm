; DESCRIPTION: Composite: Draws a yellow circle centered at (426, 157) with radius 53 then Places a black 14x39 rectangle at position (270, 132) then Places a yellow dot at position (181, 148).
; PLAN: r0=426(x), r1=157(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=270(x), r6=132(y), r7=14(width), r8=39(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=181(x), r11=148(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 426
LDI r1, 157
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 270
LDI r6, 132
LDI r7, 14
LDI r8, 39
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 181
LDI r11, 148
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
