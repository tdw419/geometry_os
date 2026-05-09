; DESCRIPTION: Composite: Creates a black circular shape at (360, 55) with radius 40 then Creates a yellow rectangular region at (28, 134) spanning 29 by 13 pixels.
; PLAN: r0=360(x), r1=55(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=28(x), r6=134(y), r7=29(width), r8=13(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 55
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 28
LDI r6, 134
LDI r7, 29
LDI r8, 13
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
