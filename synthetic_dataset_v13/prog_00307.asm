; DESCRIPTION: Composite: Creates a red rectangular region at (399, 151) spanning 87 by 39 pixels then Renders a black disk with center (118, 103) and radius 62.
; PLAN: r0=399(x), r1=151(y), r2=87(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x), r6=103(y), r7=62(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 399
LDI r1, 151
LDI r2, 87
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 103
LDI r7, 62
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
