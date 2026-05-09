; DESCRIPTION: Composite: Creates a green rectangular region at (211, 147) spanning 49 by 33 pixels then Creates a cyan circular shape at (280, 159) with radius 32.
; PLAN: r0=211(x), r1=147(y), r2=49(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=159(y), r7=32(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 211
LDI r1, 147
LDI r2, 49
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 159
LDI r7, 32
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
