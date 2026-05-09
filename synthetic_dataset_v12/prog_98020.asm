; DESCRIPTION: Composite: Renders a white disk with center (261, 135) and radius 57 then Creates a yellow rectangular region at (57, 96) spanning 57 by 57 pixels then Sets a single yellow pixel at (355, 59).
; PLAN: r0=261(x), r1=135(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=57(x), r6=96(y), r7=57(width), r8=57(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=355(x), r11=59(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 261
LDI r1, 135
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 57
LDI r6, 96
LDI r7, 57
LDI r8, 57
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 355
LDI r11, 59
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
