; DESCRIPTION: Composite: Draws a white circle centered at (138, 174) with radius 73 then Creates a black rectangular region at (76, 176) spanning 105 by 19 pixels.
; PLAN: r0=138(x), r1=174(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=76(x), r6=176(y), r7=105(width), r8=19(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 138
LDI r1, 174
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 76
LDI r6, 176
LDI r7, 105
LDI r8, 19
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
