; DESCRIPTION: Composite: Sets a single green pixel at (274, 24) then Places a white circle of radius 29 at center (157, 200) then Places a black 68x15 rectangle at position (13, 170).
; PLAN: r0=274(x), r1=24(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=157(x), r6=200(y), r7=29(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=13(x), r11=170(y), r12=68(width), r13=15(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 274
LDI r1, 24
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 157
LDI r6, 200
LDI r7, 29
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 13
LDI r11, 170
LDI r12, 68
LDI r13, 15
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
