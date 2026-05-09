; DESCRIPTION: Composite: Sets a single black pixel at (235, 42) then Places a purple 57x83 rectangle at position (88, 67) then Draws a black circle centered at (233, 63) with radius 46.
; PLAN: r0=235(x), r1=42(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=88(x), r6=67(y), r7=57(width), r8=83(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=233(x), r11=63(y), r12=46(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 235
LDI r1, 42
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 88
LDI r6, 67
LDI r7, 57
LDI r8, 83
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 63
LDI r12, 46
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
