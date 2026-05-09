; DESCRIPTION: Composite: Creates a purple rectangular region at (61, 186) spanning 46 by 35 pixels then Creates a yellow circular shape at (326, 67) with radius 24.
; PLAN: r0=61(x), r1=186(y), r2=46(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=326(x), r6=67(y), r7=24(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 61
LDI r1, 186
LDI r2, 46
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 67
LDI r7, 24
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
