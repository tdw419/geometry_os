; DESCRIPTION: Composite: Sets a single cyan pixel at (395, 75) then Creates a magenta circular shape at (472, 224) with radius 29 then Places a blue 65x37 rectangle at position (76, 6).
; PLAN: r0=395(x), r1=75(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=472(x), r6=224(y), r7=29(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=76(x), r11=6(y), r12=65(width), r13=37(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 395
LDI r1, 75
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 472
LDI r6, 224
LDI r7, 29
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 76
LDI r11, 6
LDI r12, 65
LDI r13, 37
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
