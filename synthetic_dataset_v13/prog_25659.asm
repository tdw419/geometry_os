; DESCRIPTION: Composite: Renders a black box of size 11x45 starting at (490, 100) then Places a green dot at position (81, 46) then Renders a magenta disk with center (376, 66) and radius 66.
; PLAN: r0=490(x), r1=100(y), r2=11(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=81(x), r6=46(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=376(x), r11=66(y), r12=66(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 490
LDI r1, 100
LDI r2, 11
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 46
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 376
LDI r11, 66
LDI r12, 66
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
