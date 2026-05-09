; DESCRIPTION: Composite: Sets a single black pixel at (316, 171) then Places a blue circle of radius 78 at center (298, 101) then Places a cyan 73x23 rectangle at position (405, 45).
; PLAN: r0=316(x), r1=171(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=298(x), r6=101(y), r7=78(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=405(x), r11=45(y), r12=73(width), r13=23(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 316
LDI r1, 171
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 298
LDI r6, 101
LDI r7, 78
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 405
LDI r11, 45
LDI r12, 73
LDI r13, 23
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
