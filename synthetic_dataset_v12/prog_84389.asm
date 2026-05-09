; DESCRIPTION: Composite: Places a magenta 101x22 rectangle at position (33, 224) then Draws a black circle centered at (435, 132) with radius 73 then Sets a single blue pixel at (380, 110).
; PLAN: r0=33(x), r1=224(y), r2=101(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=435(x), r6=132(y), r7=73(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=380(x), r11=110(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 33
LDI r1, 224
LDI r2, 101
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 132
LDI r7, 73
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 380
LDI r11, 110
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
