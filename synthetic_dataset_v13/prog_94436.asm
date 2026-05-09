; DESCRIPTION: Composite: Places a white 49x71 rectangle at position (378, 28) then Sets a single black pixel at (459, 163).
; PLAN: r0=378(x), r1=28(y), r2=49(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=459(x), r6=163(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 378
LDI r1, 28
LDI r2, 49
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 163
LDI r7, 0x000000
PSET r5, r6, r7
HALT
