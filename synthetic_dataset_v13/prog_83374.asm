; DESCRIPTION: Composite: Creates a black rectangular region at (130, 48) spanning 67 by 52 pixels then Creates a purple circular shape at (278, 212) with radius 32.
; PLAN: r0=130(x), r1=48(y), r2=67(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x), r6=212(y), r7=32(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 130
LDI r1, 48
LDI r2, 67
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 212
LDI r7, 32
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
