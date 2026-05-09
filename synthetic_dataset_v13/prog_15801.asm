; DESCRIPTION: Composite: Creates a magenta rectangular region at (273, 75) spanning 17 by 22 pixels then Places a purple circle of radius 14 at center (156, 179).
; PLAN: r0=273(x), r1=75(y), r2=17(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=156(x), r6=179(y), r7=14(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 273
LDI r1, 75
LDI r2, 17
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 179
LDI r7, 14
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
