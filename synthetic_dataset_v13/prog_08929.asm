; DESCRIPTION: Composite: Sets a single yellow pixel at (76, 207) then Places a white circle of radius 17 at center (458, 183) then Renders a black box of size 111x104 starting at (297, 36).
; PLAN: r0=76(x), r1=207(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=458(x), r6=183(y), r7=17(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=297(x), r11=36(y), r12=111(width), r13=104(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 76
LDI r1, 207
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 458
LDI r6, 183
LDI r7, 17
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 297
LDI r11, 36
LDI r12, 111
LDI r13, 104
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
