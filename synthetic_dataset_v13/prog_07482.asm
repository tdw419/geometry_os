; DESCRIPTION: Composite: Renders a magenta disk with center (307, 137) and radius 15 then Creates a orange rectangular region at (306, 107) spanning 73 by 110 pixels then Sets a single blue pixel at (472, 17).
; PLAN: r0=307(x), r1=137(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=306(x), r6=107(y), r7=73(width), r8=110(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=472(x), r11=17(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 307
LDI r1, 137
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 306
LDI r6, 107
LDI r7, 73
LDI r8, 110
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 472
LDI r11, 17
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
