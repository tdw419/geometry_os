; DESCRIPTION: Composite: Creates a cyan circular shape at (98, 206) with radius 22 then Draws a green rectangle at (211, 91) with width 83 and height 103 then Places a black dot at position (414, 248).
; PLAN: r0=98(x), r1=206(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=211(x), r6=91(y), r7=83(width), r8=103(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=414(x), r11=248(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 98
LDI r1, 206
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 211
LDI r6, 91
LDI r7, 83
LDI r8, 103
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 248
LDI r12, 0x000000
PSET r10, r11, r12
HALT
