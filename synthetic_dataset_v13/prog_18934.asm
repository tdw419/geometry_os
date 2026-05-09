; DESCRIPTION: Composite: Creates a yellow rectangular region at (357, 131) spanning 72 by 59 pixels then Creates a purple circular shape at (24, 67) with radius 15.
; PLAN: r0=357(x), r1=131(y), r2=72(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=24(x), r6=67(y), r7=15(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 357
LDI r1, 131
LDI r2, 72
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 67
LDI r7, 15
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
