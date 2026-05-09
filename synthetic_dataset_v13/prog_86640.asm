; DESCRIPTION: Composite: Places a white 17x14 rectangle at position (457, 133) then Creates a green circular shape at (96, 164) with radius 41.
; PLAN: r0=457(x), r1=133(y), r2=17(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=96(x), r6=164(y), r7=41(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 457
LDI r1, 133
LDI r2, 17
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 164
LDI r7, 41
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
