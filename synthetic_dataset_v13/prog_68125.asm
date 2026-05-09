; DESCRIPTION: Composite: Creates a magenta circular shape at (492, 190) with radius 12 then Creates a blue rectangular region at (53, 118) spanning 44 by 112 pixels.
; PLAN: r0=492(x), r1=190(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x), r6=118(y), r7=44(width), r8=112(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 492
LDI r1, 190
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 118
LDI r7, 44
LDI r8, 112
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
