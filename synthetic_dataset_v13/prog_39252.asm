; DESCRIPTION: Composite: Draws a cyan circle centered at (225, 143) with radius 53 then Creates a black rectangular region at (341, 19) spanning 76 by 94 pixels.
; PLAN: r0=225(x), r1=143(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=341(x), r6=19(y), r7=76(width), r8=94(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 225
LDI r1, 143
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 341
LDI r6, 19
LDI r7, 76
LDI r8, 94
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
