; DESCRIPTION: Composite: Places a purple dot at position (14, 43) then Draws a cyan circle centered at (272, 183) with radius 28 then Draws a purple rectangle at (380, 62) with width 97 and height 12.
; PLAN: r0=14(x), r1=43(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=272(x), r6=183(y), r7=28(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=380(x), r11=62(y), r12=97(width), r13=12(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 14
LDI r1, 43
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 272
LDI r6, 183
LDI r7, 28
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 380
LDI r11, 62
LDI r12, 97
LDI r13, 12
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
