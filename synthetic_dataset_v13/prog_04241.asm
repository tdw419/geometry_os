; DESCRIPTION: Composite: Places a magenta 55x26 rectangle at position (183, 130) then Creates a black circular shape at (137, 190) with radius 44 then Sets a single blue pixel at (498, 197).
; PLAN: r0=183(x), r1=130(y), r2=55(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x), r6=190(y), r7=44(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=498(x), r11=197(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 183
LDI r1, 130
LDI r2, 55
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 190
LDI r7, 44
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 498
LDI r11, 197
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
