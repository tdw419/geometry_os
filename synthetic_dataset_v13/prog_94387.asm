; DESCRIPTION: Composite: Places a yellow 53x32 rectangle at position (385, 137) then Draws a green circle centered at (287, 86) with radius 74 then Places a yellow dot at position (207, 109).
; PLAN: r0=385(x), r1=137(y), r2=53(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=287(x), r6=86(y), r7=74(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=207(x), r11=109(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 385
LDI r1, 137
LDI r2, 53
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 86
LDI r7, 74
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 207
LDI r11, 109
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
