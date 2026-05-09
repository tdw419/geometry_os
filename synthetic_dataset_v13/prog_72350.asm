; DESCRIPTION: Composite: Creates a yellow rectangular region at (402, 1) spanning 15 by 91 pixels then Places a black circle of radius 55 at center (286, 128).
; PLAN: r0=402(x), r1=1(y), r2=15(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=286(x), r6=128(y), r7=55(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 402
LDI r1, 1
LDI r2, 15
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 128
LDI r7, 55
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
