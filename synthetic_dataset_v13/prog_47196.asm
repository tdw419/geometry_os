; DESCRIPTION: Composite: Places a red 44x46 rectangle at position (179, 97) then Creates a purple circular shape at (201, 102) with radius 78.
; PLAN: r0=179(x), r1=97(y), r2=44(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=201(x), r6=102(y), r7=78(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 179
LDI r1, 97
LDI r2, 44
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 102
LDI r7, 78
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
