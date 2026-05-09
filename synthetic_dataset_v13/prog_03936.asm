; DESCRIPTION: Composite: Sets a single red pixel at (509, 245) then Places a purple circle of radius 15 at center (113, 106) then Creates a yellow rectangular region at (81, 84) spanning 83 by 110 pixels.
; PLAN: r0=509(x), r1=245(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=113(x), r6=106(y), r7=15(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=81(x), r11=84(y), r12=83(width), r13=110(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 509
LDI r1, 245
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 113
LDI r6, 106
LDI r7, 15
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 81
LDI r11, 84
LDI r12, 83
LDI r13, 110
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
