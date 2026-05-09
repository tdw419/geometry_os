; DESCRIPTION: Composite: Creates a black rectangular region at (116, 67) spanning 111 by 90 pixels then Draws a yellow circle centered at (397, 151) with radius 77 then Sets a single white pixel at (411, 222).
; PLAN: r0=116(x), r1=67(y), r2=111(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=397(x), r6=151(y), r7=77(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=411(x), r11=222(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 116
LDI r1, 67
LDI r2, 111
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 151
LDI r7, 77
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 411
LDI r11, 222
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
