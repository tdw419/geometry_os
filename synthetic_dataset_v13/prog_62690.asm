; DESCRIPTION: Composite: Creates a cyan rectangular region at (89, 54) spanning 34 by 109 pixels then Creates a purple circular shape at (324, 111) with radius 58.
; PLAN: r0=89(x), r1=54(y), r2=34(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=324(x), r6=111(y), r7=58(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 89
LDI r1, 54
LDI r2, 34
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 111
LDI r7, 58
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
