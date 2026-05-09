; DESCRIPTION: Composite: Creates a yellow rectangular region at (47, 20) spanning 53 by 101 pixels then Renders a magenta disk with center (378, 85) and radius 75 then Sets a single blue pixel at (1, 162).
; PLAN: r0=47(x), r1=20(y), r2=53(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=378(x), r6=85(y), r7=75(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=1(x), r11=162(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 47
LDI r1, 20
LDI r2, 53
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 85
LDI r7, 75
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 1
LDI r11, 162
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
