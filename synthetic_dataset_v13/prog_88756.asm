; DESCRIPTION: Composite: Places a blue circle of radius 44 at center (129, 156) then Creates a white rectangular region at (205, 182) spanning 109 by 52 pixels.
; PLAN: r0=129(x), r1=156(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=205(x), r6=182(y), r7=109(width), r8=52(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 156
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 205
LDI r6, 182
LDI r7, 109
LDI r8, 52
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
