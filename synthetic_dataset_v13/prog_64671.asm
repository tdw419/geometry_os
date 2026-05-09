; DESCRIPTION: Composite: Places a white 19x71 rectangle at position (172, 173) then Creates a black circular shape at (269, 75) with radius 33.
; PLAN: r0=172(x), r1=173(y), r2=19(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=269(x), r6=75(y), r7=33(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 172
LDI r1, 173
LDI r2, 19
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 75
LDI r7, 33
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
