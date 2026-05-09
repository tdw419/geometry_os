; DESCRIPTION: Composite: Creates a black rectangular region at (30, 104) spanning 81 by 94 pixels then Draws a red circle centered at (309, 120) with radius 61.
; PLAN: r0=30(x), r1=104(y), r2=81(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=309(x), r6=120(y), r7=61(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 30
LDI r1, 104
LDI r2, 81
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 120
LDI r7, 61
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
