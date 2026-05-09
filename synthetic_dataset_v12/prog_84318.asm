; DESCRIPTION: Composite: Creates a blue rectangular region at (314, 191) spanning 57 by 29 pixels then Creates a red circular shape at (445, 99) with radius 37.
; PLAN: r0=314(x), r1=191(y), r2=57(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=445(x), r6=99(y), r7=37(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 314
LDI r1, 191
LDI r2, 57
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 99
LDI r7, 37
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
