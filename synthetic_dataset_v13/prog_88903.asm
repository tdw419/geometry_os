; DESCRIPTION: Composite: Creates a magenta rectangular region at (93, 148) spanning 28 by 77 pixels then Creates a blue circular shape at (319, 59) with radius 37.
; PLAN: r0=93(x), r1=148(y), r2=28(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x), r6=59(y), r7=37(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 93
LDI r1, 148
LDI r2, 28
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 59
LDI r7, 37
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
