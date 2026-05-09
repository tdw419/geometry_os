; DESCRIPTION: Composite: Places a cyan 81x101 rectangle at position (419, 64) then Creates a orange circular shape at (104, 138) with radius 38.
; PLAN: r0=419(x), r1=64(y), r2=81(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=104(x), r6=138(y), r7=38(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 419
LDI r1, 64
LDI r2, 81
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 138
LDI r7, 38
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
