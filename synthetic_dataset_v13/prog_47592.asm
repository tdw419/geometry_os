; DESCRIPTION: Composite: Creates a yellow rectangular region at (132, 182) spanning 18 by 55 pixels then Creates a purple circular shape at (240, 93) with radius 75.
; PLAN: r0=132(x), r1=182(y), r2=18(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x), r6=93(y), r7=75(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 132
LDI r1, 182
LDI r2, 18
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 93
LDI r7, 75
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
