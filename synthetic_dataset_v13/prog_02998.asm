; DESCRIPTION: Composite: Places a purple circle of radius 53 at center (285, 136) then Creates a red rectangular region at (183, 78) spanning 96 by 53 pixels then Sets a single purple pixel at (419, 185).
; PLAN: r0=285(x), r1=136(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=183(x), r6=78(y), r7=96(width), r8=53(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=419(x), r11=185(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 285
LDI r1, 136
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 183
LDI r6, 78
LDI r7, 96
LDI r8, 53
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 419
LDI r11, 185
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
