; DESCRIPTION: Composite: Creates a red circular shape at (167, 182) with radius 53 then Creates a black rectangular region at (266, 144) spanning 80 by 51 pixels.
; PLAN: r0=167(x), r1=182(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=266(x), r6=144(y), r7=80(width), r8=51(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 167
LDI r1, 182
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 266
LDI r6, 144
LDI r7, 80
LDI r8, 51
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
