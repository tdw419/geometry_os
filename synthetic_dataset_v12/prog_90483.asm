; DESCRIPTION: Composite: Creates a red rectangular region at (417, 118) spanning 52 by 62 pixels then Places a blue circle of radius 52 at center (244, 106).
; PLAN: r0=417(x), r1=118(y), r2=52(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=244(x), r6=106(y), r7=52(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 417
LDI r1, 118
LDI r2, 52
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 106
LDI r7, 52
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
