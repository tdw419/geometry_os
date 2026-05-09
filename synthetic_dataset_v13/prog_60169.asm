; DESCRIPTION: Composite: Places a orange 37x99 rectangle at position (178, 22) then Creates a black circular shape at (141, 136) with radius 58.
; PLAN: r0=178(x), r1=22(y), r2=37(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=141(x), r6=136(y), r7=58(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 178
LDI r1, 22
LDI r2, 37
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 136
LDI r7, 58
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
