; DESCRIPTION: Composite: Creates a yellow rectangular region at (12, 140) spanning 76 by 53 pixels then Draws a white circle centered at (441, 35) with radius 15 then Sets a single magenta pixel at (378, 218).
; PLAN: r0=12(x), r1=140(y), r2=76(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=441(x), r6=35(y), r7=15(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=378(x), r11=218(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 12
LDI r1, 140
LDI r2, 76
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 35
LDI r7, 15
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 378
LDI r11, 218
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
