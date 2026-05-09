; DESCRIPTION: Composite: Sets a single white pixel at (97, 232) then Renders a black box of size 119x14 starting at (290, 27) then Draws a purple circle centered at (147, 138) with radius 32.
; PLAN: r0=97(x), r1=232(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=290(x), r6=27(y), r7=119(width), r8=14(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=147(x), r11=138(y), r12=32(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 97
LDI r1, 232
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 290
LDI r6, 27
LDI r7, 119
LDI r8, 14
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 147
LDI r11, 138
LDI r12, 32
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
