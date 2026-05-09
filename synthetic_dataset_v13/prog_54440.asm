; DESCRIPTION: Composite: Places a purple dot at position (188, 3) then Creates a white circular shape at (93, 180) with radius 73 then Creates a yellow rectangular region at (95, 110) spanning 101 by 28 pixels.
; PLAN: r0=188(x), r1=3(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=93(x), r6=180(y), r7=73(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=95(x), r11=110(y), r12=101(width), r13=28(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 188
LDI r1, 3
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 93
LDI r6, 180
LDI r7, 73
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 95
LDI r11, 110
LDI r12, 101
LDI r13, 28
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
