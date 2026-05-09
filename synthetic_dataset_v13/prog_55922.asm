; DESCRIPTION: Composite: Sets a single orange pixel at (56, 156) then Draws a magenta circle centered at (427, 90) with radius 53 then Places a cyan 96x21 rectangle at position (205, 97).
; PLAN: r0=56(x), r1=156(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=427(x), r6=90(y), r7=53(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=205(x), r11=97(y), r12=96(width), r13=21(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 56
LDI r1, 156
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 427
LDI r6, 90
LDI r7, 53
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 205
LDI r11, 97
LDI r12, 96
LDI r13, 21
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
