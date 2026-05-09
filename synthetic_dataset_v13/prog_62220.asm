; DESCRIPTION: Composite: Creates a red rectangular region at (298, 7) spanning 34 by 103 pixels then Draws a white circle centered at (114, 179) with radius 62.
; PLAN: r0=298(x), r1=7(y), r2=34(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=114(x), r6=179(y), r7=62(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 298
LDI r1, 7
LDI r2, 34
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 179
LDI r7, 62
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
