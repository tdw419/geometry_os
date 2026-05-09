; DESCRIPTION: Composite: Sets a single green pixel at (315, 114) then Places a black 39x109 rectangle at position (36, 29) then Draws a black circle centered at (213, 101) with radius 29.
; PLAN: r0=315(x), r1=114(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=36(x), r6=29(y), r7=39(width), r8=109(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=213(x), r11=101(y), r12=29(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 315
LDI r1, 114
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 36
LDI r6, 29
LDI r7, 39
LDI r8, 109
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 213
LDI r11, 101
LDI r12, 29
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
