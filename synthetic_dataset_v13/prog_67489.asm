; DESCRIPTION: Composite: Places a purple 13x107 rectangle at position (36, 106) then Draws a black circle centered at (327, 224) with radius 14 then Places a white dot at position (400, 224).
; PLAN: r0=36(x), r1=106(y), r2=13(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=327(x), r6=224(y), r7=14(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=400(x), r11=224(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 36
LDI r1, 106
LDI r2, 13
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 224
LDI r7, 14
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 400
LDI r11, 224
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
