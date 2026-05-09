; DESCRIPTION: Composite: Places a purple circle of radius 72 at center (351, 171) then Creates a yellow rectangular region at (137, 41) spanning 96 by 53 pixels.
; PLAN: r0=351(x), r1=171(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=137(x), r6=41(y), r7=96(width), r8=53(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 351
LDI r1, 171
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 137
LDI r6, 41
LDI r7, 96
LDI r8, 53
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
