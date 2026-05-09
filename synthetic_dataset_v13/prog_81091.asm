; DESCRIPTION: Composite: Creates a blue circular shape at (137, 81) with radius 35 then Creates a purple rectangular region at (14, 140) spanning 103 by 17 pixels.
; PLAN: r0=137(x), r1=81(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=14(x), r6=140(y), r7=103(width), r8=17(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 137
LDI r1, 81
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 14
LDI r6, 140
LDI r7, 103
LDI r8, 17
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
