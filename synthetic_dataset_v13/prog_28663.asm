; DESCRIPTION: Composite: Creates a yellow circular shape at (353, 201) with radius 21 then Creates a green rectangular region at (312, 31) spanning 112 by 62 pixels.
; PLAN: r0=353(x), r1=201(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=312(x), r6=31(y), r7=112(width), r8=62(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 353
LDI r1, 201
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 312
LDI r6, 31
LDI r7, 112
LDI r8, 62
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
