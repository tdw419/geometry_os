; DESCRIPTION: Composite: Sets a single black pixel at (28, 216) then Places a white 74x83 rectangle at position (352, 14) then Draws a yellow circle centered at (381, 130) with radius 58.
; PLAN: r0=28(x), r1=216(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=352(x), r6=14(y), r7=74(width), r8=83(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=381(x), r11=130(y), r12=58(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 28
LDI r1, 216
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 352
LDI r6, 14
LDI r7, 74
LDI r8, 83
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 381
LDI r11, 130
LDI r12, 58
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
