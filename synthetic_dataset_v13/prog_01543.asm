; DESCRIPTION: Composite: Creates a black circular shape at (182, 90) with radius 19 then Places a purple 94x119 rectangle at position (308, 49).
; PLAN: r0=182(x), r1=90(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=308(x), r6=49(y), r7=94(width), r8=119(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 182
LDI r1, 90
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 308
LDI r6, 49
LDI r7, 94
LDI r8, 119
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
