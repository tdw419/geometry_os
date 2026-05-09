; DESCRIPTION: Composite: Creates a white rectangular region at (320, 191) spanning 118 by 57 pixels then Places a yellow circle of radius 60 at center (289, 191).
; PLAN: r0=320(x), r1=191(y), r2=118(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=289(x), r6=191(y), r7=60(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 320
LDI r1, 191
LDI r2, 118
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 191
LDI r7, 60
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
