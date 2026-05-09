; DESCRIPTION: Composite: Creates a black circular shape at (254, 108) with radius 75 then Renders a red box of size 19x66 starting at (114, 122).
; PLAN: r0=254(x), r1=108(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=114(x), r6=122(y), r7=19(width), r8=66(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 108
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 114
LDI r6, 122
LDI r7, 19
LDI r8, 66
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
