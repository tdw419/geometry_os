; DESCRIPTION: Composite: Places a white circle of radius 74 at center (266, 177) then Creates a yellow rectangular region at (332, 25) spanning 15 by 95 pixels then Sets a single blue pixel at (175, 144).
; PLAN: r0=266(x), r1=177(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=332(x), r6=25(y), r7=15(width), r8=95(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=175(x), r11=144(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 266
LDI r1, 177
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 332
LDI r6, 25
LDI r7, 15
LDI r8, 95
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 175
LDI r11, 144
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
