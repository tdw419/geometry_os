; DESCRIPTION: Composite: Draws a red circle centered at (164, 73) with radius 51 then Creates a black rectangular region at (150, 172) spanning 73 by 44 pixels then Sets a single white pixel at (361, 69).
; PLAN: r0=164(x), r1=73(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=150(x), r6=172(y), r7=73(width), r8=44(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=361(x), r11=69(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 164
LDI r1, 73
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 150
LDI r6, 172
LDI r7, 73
LDI r8, 44
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 361
LDI r11, 69
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
