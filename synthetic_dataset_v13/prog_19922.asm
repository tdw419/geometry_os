; DESCRIPTION: Composite: Sets a single orange pixel at (268, 234) then Creates a black circular shape at (373, 87) with radius 53 then Draws a yellow rectangle at (131, 39) with width 97 and height 53.
; PLAN: r0=268(x), r1=234(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=373(x), r6=87(y), r7=53(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=131(x), r11=39(y), r12=97(width), r13=53(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 234
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 373
LDI r6, 87
LDI r7, 53
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 131
LDI r11, 39
LDI r12, 97
LDI r13, 53
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
