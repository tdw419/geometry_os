; DESCRIPTION: Composite: Creates a purple circular shape at (427, 191) with radius 56 then Places a red 101x100 rectangle at position (219, 58).
; PLAN: r0=427(x), r1=191(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=219(x), r6=58(y), r7=101(width), r8=100(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 427
LDI r1, 191
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 219
LDI r6, 58
LDI r7, 101
LDI r8, 100
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
