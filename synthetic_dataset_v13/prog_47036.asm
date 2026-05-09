; DESCRIPTION: Composite: Places a cyan dot at position (29, 28) then Draws a blue rectangle at (53, 35) with width 81 and height 15 then Places a black circle of radius 17 at center (490, 47).
; PLAN: r0=29(x), r1=28(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=53(x), r6=35(y), r7=81(width), r8=15(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=490(x), r11=47(y), r12=17(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 29
LDI r1, 28
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 53
LDI r6, 35
LDI r7, 81
LDI r8, 15
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 490
LDI r11, 47
LDI r12, 17
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
