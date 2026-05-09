; DESCRIPTION: Composite: Creates a black circular shape at (420, 182) with radius 39 then Creates a white rectangular region at (84, 132) spanning 120 by 119 pixels.
; PLAN: r0=420(x), r1=182(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=84(x), r6=132(y), r7=120(width), r8=119(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 420
LDI r1, 182
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 84
LDI r6, 132
LDI r7, 120
LDI r8, 119
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
