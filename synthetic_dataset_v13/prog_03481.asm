; DESCRIPTION: Composite: Sets a single purple pixel at (250, 189) then Places a orange circle of radius 74 at center (246, 143) then Creates a green rectangular region at (145, 16) spanning 119 by 28 pixels.
; PLAN: r0=250(x), r1=189(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=246(x), r6=143(y), r7=74(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=145(x), r11=16(y), r12=119(width), r13=28(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 250
LDI r1, 189
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 246
LDI r6, 143
LDI r7, 74
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 145
LDI r11, 16
LDI r12, 119
LDI r13, 28
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
