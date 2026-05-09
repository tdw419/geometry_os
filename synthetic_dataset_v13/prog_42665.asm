; DESCRIPTION: Composite: Creates a red rectangular region at (194, 73) spanning 80 by 113 pixels then Creates a purple circular shape at (424, 150) with radius 27.
; PLAN: r0=194(x), r1=73(y), r2=80(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=424(x), r6=150(y), r7=27(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 194
LDI r1, 73
LDI r2, 80
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 150
LDI r7, 27
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
