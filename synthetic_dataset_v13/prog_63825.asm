; DESCRIPTION: Composite: Creates a white rectangular region at (21, 2) spanning 114 by 99 pixels then Draws a white circle centered at (245, 170) with radius 80 then Places a purple dot at position (261, 189).
; PLAN: r0=21(x), r1=2(y), r2=114(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=245(x), r6=170(y), r7=80(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=261(x), r11=189(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 21
LDI r1, 2
LDI r2, 114
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 170
LDI r7, 80
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 261
LDI r11, 189
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
