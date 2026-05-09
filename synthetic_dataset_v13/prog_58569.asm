; DESCRIPTION: Composite: Creates a purple rectangular region at (472, 22) spanning 40 by 57 pixels then Renders a white disk with center (225, 106) and radius 65.
; PLAN: r0=472(x), r1=22(y), r2=40(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=225(x), r6=106(y), r7=65(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 472
LDI r1, 22
LDI r2, 40
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 106
LDI r7, 65
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
