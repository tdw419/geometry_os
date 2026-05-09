; DESCRIPTION: Composite: Creates a black circular shape at (448, 226) with radius 28 then Creates a red rectangular region at (451, 212) spanning 38 by 33 pixels.
; PLAN: r0=448(x), r1=226(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x), r6=212(y), r7=38(width), r8=33(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 448
LDI r1, 226
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 212
LDI r7, 38
LDI r8, 33
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
