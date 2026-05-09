; DESCRIPTION: Composite: Creates a blue circular shape at (414, 194) with radius 60 then Creates a blue rectangular region at (475, 56) spanning 22 by 110 pixels.
; PLAN: r0=414(x), r1=194(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=475(x), r6=56(y), r7=22(width), r8=110(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 194
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 475
LDI r6, 56
LDI r7, 22
LDI r8, 110
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
