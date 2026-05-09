; DESCRIPTION: Composite: Creates a black rectangular region at (135, 132) spanning 13 by 76 pixels then Places a black circle of radius 38 at center (141, 126).
; PLAN: r0=135(x), r1=132(y), r2=13(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=141(x), r6=126(y), r7=38(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 135
LDI r1, 132
LDI r2, 13
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 126
LDI r7, 38
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
