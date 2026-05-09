; DESCRIPTION: Composite: Creates a blue rectangular region at (78, 49) spanning 89 by 32 pixels then Renders a blue disk with center (430, 91) and radius 32.
; PLAN: r0=78(x), r1=49(y), r2=89(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=430(x), r6=91(y), r7=32(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 78
LDI r1, 49
LDI r2, 89
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 91
LDI r7, 32
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
