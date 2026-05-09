; DESCRIPTION: Composite: Creates a blue rectangular region at (251, 74) spanning 119 by 110 pixels then Places a magenta circle of radius 58 at center (129, 189).
; PLAN: r0=251(x), r1=74(y), r2=119(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=129(x), r6=189(y), r7=58(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 251
LDI r1, 74
LDI r2, 119
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 189
LDI r7, 58
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
