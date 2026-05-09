; DESCRIPTION: Composite: Sets a single white pixel at (25, 176) then Creates a black rectangular region at (359, 124) spanning 92 by 114 pixels then Draws a red circle centered at (53, 111) with radius 42.
; PLAN: r0=25(x), r1=176(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=359(x), r6=124(y), r7=92(width), r8=114(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=53(x), r11=111(y), r12=42(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 25
LDI r1, 176
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 359
LDI r6, 124
LDI r7, 92
LDI r8, 114
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 53
LDI r11, 111
LDI r12, 42
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
