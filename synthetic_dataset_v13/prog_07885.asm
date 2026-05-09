; DESCRIPTION: Composite: Draws a purple circle centered at (141, 52) with radius 18 then Places a magenta 15x38 rectangle at position (311, 32) then Sets a single blue pixel at (342, 147).
; PLAN: r0=141(x), r1=52(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=311(x), r6=32(y), r7=15(width), r8=38(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=342(x), r11=147(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 141
LDI r1, 52
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 311
LDI r6, 32
LDI r7, 15
LDI r8, 38
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 342
LDI r11, 147
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
