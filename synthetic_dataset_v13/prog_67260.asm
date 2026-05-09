; DESCRIPTION: Composite: Places a purple 112x43 rectangle at position (256, 62) then Creates a black circular shape at (281, 83) with radius 57.
; PLAN: r0=256(x), r1=62(y), r2=112(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=281(x), r6=83(y), r7=57(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 256
LDI r1, 62
LDI r2, 112
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 83
LDI r7, 57
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
