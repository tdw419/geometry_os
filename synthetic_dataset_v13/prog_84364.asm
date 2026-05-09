; DESCRIPTION: Composite: Creates a blue circular shape at (326, 134) with radius 53 then Creates a orange rectangular region at (236, 118) spanning 47 by 17 pixels.
; PLAN: r0=326(x), r1=134(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=236(x), r6=118(y), r7=47(width), r8=17(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 326
LDI r1, 134
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 236
LDI r6, 118
LDI r7, 47
LDI r8, 17
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
