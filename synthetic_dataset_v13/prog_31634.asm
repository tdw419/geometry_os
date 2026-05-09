; DESCRIPTION: Composite: Renders a blue box of size 54x101 starting at (291, 109) then Creates a blue circular shape at (139, 111) with radius 42 then Places a purple dot at position (460, 7).
; PLAN: r0=291(x), r1=109(y), r2=54(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=139(x), r6=111(y), r7=42(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=460(x), r11=7(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 291
LDI r1, 109
LDI r2, 54
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 111
LDI r7, 42
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 460
LDI r11, 7
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
