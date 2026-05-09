; DESCRIPTION: Composite: Draws a white line from (194, 92) to (8, 126) then Creates a black circular shape at (376, 172) with radius 15.
; PLAN: r0=194(x1), r1=92(y1), r2=8(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=376(x), r6=172(y), r7=15(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 194
LDI r1, 92
LDI r2, 8
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 172
LDI r7, 15
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
