; DESCRIPTION: Composite: Creates a black rectangular region at (53, 42) spanning 46 by 60 pixels then Draws a white circle centered at (444, 44) with radius 26.
; PLAN: r0=53(x), r1=42(y), r2=46(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=444(x), r6=44(y), r7=26(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 53
LDI r1, 42
LDI r2, 46
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 44
LDI r7, 26
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
