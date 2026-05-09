; DESCRIPTION: Composite: Draws a blue rectangle at (85, 20) with width 66 and height 53 then Places a black circle of radius 57 at center (304, 98) then Sets a single black pixel at (311, 50).
; PLAN: r0=85(x), r1=20(y), r2=66(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=304(x), r6=98(y), r7=57(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=311(x), r11=50(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 85
LDI r1, 20
LDI r2, 66
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 98
LDI r7, 57
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 311
LDI r11, 50
LDI r12, 0x000000
PSET r10, r11, r12
HALT
