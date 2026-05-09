; DESCRIPTION: Composite: Creates a black rectangular region at (137, 124) spanning 118 by 103 pixels then Places a red circle of radius 39 at center (106, 217).
; PLAN: r0=137(x), r1=124(y), r2=118(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x), r6=217(y), r7=39(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 137
LDI r1, 124
LDI r2, 118
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 217
LDI r7, 39
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
