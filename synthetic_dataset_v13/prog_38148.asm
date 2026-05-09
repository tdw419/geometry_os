; DESCRIPTION: Composite: Renders a black box of size 80x18 starting at (263, 87) then Draws a black circle centered at (179, 172) with radius 17 then Places a orange dot at position (153, 131).
; PLAN: r0=263(x), r1=87(y), r2=80(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=179(x), r6=172(y), r7=17(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=153(x), r11=131(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 263
LDI r1, 87
LDI r2, 80
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 172
LDI r7, 17
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 153
LDI r11, 131
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
