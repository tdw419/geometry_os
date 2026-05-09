; DESCRIPTION: Composite: Sets a single yellow pixel at (116, 56) then Creates a magenta circular shape at (458, 164) with radius 14 then Draws a purple rectangle at (143, 18) with width 92 and height 110.
; PLAN: r0=116(x), r1=56(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=458(x), r6=164(y), r7=14(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=143(x), r11=18(y), r12=92(width), r13=110(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 116
LDI r1, 56
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 458
LDI r6, 164
LDI r7, 14
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 143
LDI r11, 18
LDI r12, 92
LDI r13, 110
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
