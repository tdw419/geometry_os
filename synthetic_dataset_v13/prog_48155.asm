; DESCRIPTION: Composite: Places a purple 17x87 rectangle at position (422, 68) then Creates a orange circular shape at (231, 183) with radius 41.
; PLAN: r0=422(x), r1=68(y), r2=17(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=231(x), r6=183(y), r7=41(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 422
LDI r1, 68
LDI r2, 17
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 183
LDI r7, 41
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
