; DESCRIPTION: Composite: Sets a single white pixel at (417, 41) then Renders a white box of size 17x37 starting at (286, 156) then Draws a black circle centered at (67, 161) with radius 63.
; PLAN: r0=417(x), r1=41(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=286(x), r6=156(y), r7=17(width), r8=37(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=67(x), r11=161(y), r12=63(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 417
LDI r1, 41
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 286
LDI r6, 156
LDI r7, 17
LDI r8, 37
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 67
LDI r11, 161
LDI r12, 63
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
