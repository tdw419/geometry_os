; DESCRIPTION: Composite: Creates a blue rectangular region at (118, 165) spanning 89 by 31 pixels then Creates a yellow circular shape at (280, 158) with radius 60.
; PLAN: r0=118(x), r1=165(y), r2=89(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=158(y), r7=60(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 118
LDI r1, 165
LDI r2, 89
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 158
LDI r7, 60
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
