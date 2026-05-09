; DESCRIPTION: Composite: Creates a yellow rectangular region at (354, 107) spanning 83 by 88 pixels then Creates a orange circular shape at (445, 225) with radius 20.
; PLAN: r0=354(x), r1=107(y), r2=83(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=445(x), r6=225(y), r7=20(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 354
LDI r1, 107
LDI r2, 83
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 225
LDI r7, 20
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
