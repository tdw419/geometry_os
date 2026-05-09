; DESCRIPTION: Composite: Draws a black circle centered at (139, 183) with radius 70 then Creates a red rectangular region at (416, 82) spanning 82 by 84 pixels then Sets a single yellow pixel at (40, 190).
; PLAN: r0=139(x), r1=183(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=416(x), r6=82(y), r7=82(width), r8=84(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=40(x), r11=190(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 139
LDI r1, 183
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 416
LDI r6, 82
LDI r7, 82
LDI r8, 84
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 40
LDI r11, 190
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
