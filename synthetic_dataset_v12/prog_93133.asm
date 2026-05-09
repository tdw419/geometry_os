; DESCRIPTION: Composite: Creates a orange rectangular region at (81, 76) spanning 115 by 28 pixels then Places a white circle of radius 33 at center (261, 206).
; PLAN: r0=81(x), r1=76(y), r2=115(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=261(x), r6=206(y), r7=33(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 81
LDI r1, 76
LDI r2, 115
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 206
LDI r7, 33
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
