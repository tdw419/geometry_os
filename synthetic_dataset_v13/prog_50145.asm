; DESCRIPTION: Composite: Creates a yellow circular shape at (81, 202) with radius 49 then Creates a orange rectangular region at (325, 24) spanning 64 by 118 pixels.
; PLAN: r0=81(x), r1=202(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=325(x), r6=24(y), r7=64(width), r8=118(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 81
LDI r1, 202
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 325
LDI r6, 24
LDI r7, 64
LDI r8, 118
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
