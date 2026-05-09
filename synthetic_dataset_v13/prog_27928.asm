; DESCRIPTION: Composite: Creates a yellow rectangular region at (101, 25) spanning 94 by 103 pixels then Creates a orange circular shape at (238, 53) with radius 53.
; PLAN: r0=101(x), r1=25(y), r2=94(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=238(x), r6=53(y), r7=53(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 101
LDI r1, 25
LDI r2, 94
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 53
LDI r7, 53
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
