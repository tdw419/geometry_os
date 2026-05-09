; DESCRIPTION: Composite: Creates a blue rectangular region at (83, 18) spanning 65 by 28 pixels then Sets a single purple pixel at (199, 15) then Renders a blue disk with center (183, 46) and radius 39.
; PLAN: r0=83(x), r1=18(y), r2=65(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=199(x), r6=15(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=183(x), r11=46(y), r12=39(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 83
LDI r1, 18
LDI r2, 65
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 15
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 183
LDI r11, 46
LDI r12, 39
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
