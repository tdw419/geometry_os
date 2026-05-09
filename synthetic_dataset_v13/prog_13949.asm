; DESCRIPTION: Composite: Creates a white rectangular region at (114, 218) spanning 15 by 19 pixels then Places a black circle of radius 64 at center (329, 114).
; PLAN: r0=114(x), r1=218(y), r2=15(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=329(x), r6=114(y), r7=64(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 114
LDI r1, 218
LDI r2, 15
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 114
LDI r7, 64
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
