; DESCRIPTION: Composite: Places a blue circle of radius 15 at center (163, 56) then Creates a red rectangular region at (439, 71) spanning 20 by 119 pixels.
; PLAN: r0=163(x), r1=56(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=439(x), r6=71(y), r7=20(width), r8=119(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 163
LDI r1, 56
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 439
LDI r6, 71
LDI r7, 20
LDI r8, 119
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
