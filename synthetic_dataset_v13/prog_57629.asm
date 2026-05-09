; DESCRIPTION: Composite: Draws a magenta circle centered at (252, 46) with radius 17 then Sets a single black pixel at (373, 83) then Creates a orange rectangular region at (131, 3) spanning 102 by 120 pixels.
; PLAN: r0=252(x), r1=46(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=373(x), r6=83(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=131(x), r11=3(y), r12=102(width), r13=120(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 252
LDI r1, 46
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 373
LDI r6, 83
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 131
LDI r11, 3
LDI r12, 102
LDI r13, 120
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
