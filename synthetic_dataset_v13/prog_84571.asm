; DESCRIPTION: Composite: Creates a yellow rectangular region at (87, 201) spanning 22 by 54 pixels then Renders a white disk with center (439, 154) and radius 70.
; PLAN: r0=87(x), r1=201(y), r2=22(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x), r6=154(y), r7=70(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 87
LDI r1, 201
LDI r2, 22
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 154
LDI r7, 70
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
