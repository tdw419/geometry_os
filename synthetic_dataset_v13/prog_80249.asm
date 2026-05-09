; DESCRIPTION: Composite: Sets a single blue pixel at (278, 234) then Draws a yellow circle centered at (442, 190) with radius 55 then Places a cyan 58x73 rectangle at position (205, 38).
; PLAN: r0=278(x), r1=234(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=442(x), r6=190(y), r7=55(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=205(x), r11=38(y), r12=58(width), r13=73(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 278
LDI r1, 234
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 442
LDI r6, 190
LDI r7, 55
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 205
LDI r11, 38
LDI r12, 58
LDI r13, 73
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
