; DESCRIPTION: Composite: Renders a blue box of size 114x91 starting at (146, 35) then Places a yellow dot at position (132, 224) then Creates a white circular shape at (376, 87) with radius 74.
; PLAN: r0=146(x), r1=35(y), r2=114(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=132(x), r6=224(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=376(x), r11=87(y), r12=74(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 146
LDI r1, 35
LDI r2, 114
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 224
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 376
LDI r11, 87
LDI r12, 74
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
