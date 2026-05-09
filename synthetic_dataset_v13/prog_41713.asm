; DESCRIPTION: Composite: Creates a white rectangular region at (37, 2) spanning 59 by 98 pixels then Sets a single white pixel at (421, 24) then Draws a red circle centered at (406, 137) with radius 33.
; PLAN: r0=37(x), r1=2(y), r2=59(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=421(x), r6=24(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=406(x), r11=137(y), r12=33(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 37
LDI r1, 2
LDI r2, 59
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 24
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 406
LDI r11, 137
LDI r12, 33
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
