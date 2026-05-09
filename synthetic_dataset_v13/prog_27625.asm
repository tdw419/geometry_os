; DESCRIPTION: Composite: Creates a blue rectangular region at (341, 131) spanning 70 by 59 pixels then Draws a green circle centered at (347, 190) with radius 65 then Sets a single purple pixel at (383, 73).
; PLAN: r0=341(x), r1=131(y), r2=70(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x), r6=190(y), r7=65(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=383(x), r11=73(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 341
LDI r1, 131
LDI r2, 70
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 190
LDI r7, 65
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 383
LDI r11, 73
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
