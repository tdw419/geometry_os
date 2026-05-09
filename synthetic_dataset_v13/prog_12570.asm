; DESCRIPTION: Composite: Creates a yellow circular shape at (138, 224) with radius 32 then Creates a purple rectangular region at (29, 129) spanning 12 by 39 pixels then Sets a single white pixel at (297, 3).
; PLAN: r0=138(x), r1=224(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=29(x), r6=129(y), r7=12(width), r8=39(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=297(x), r11=3(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 138
LDI r1, 224
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 29
LDI r6, 129
LDI r7, 12
LDI r8, 39
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 297
LDI r11, 3
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
