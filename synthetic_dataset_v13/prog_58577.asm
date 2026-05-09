; DESCRIPTION: Composite: Places a black 71x12 rectangle at position (257, 191) then Creates a black circular shape at (153, 83) with radius 12.
; PLAN: r0=257(x), r1=191(y), r2=71(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=153(x), r6=83(y), r7=12(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 257
LDI r1, 191
LDI r2, 71
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 83
LDI r7, 12
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
