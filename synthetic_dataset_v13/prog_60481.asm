; DESCRIPTION: Composite: Creates a blue circular shape at (137, 82) with radius 69 then Creates a black rectangular region at (369, 30) spanning 32 by 66 pixels.
; PLAN: r0=137(x), r1=82(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=369(x), r6=30(y), r7=32(width), r8=66(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 137
LDI r1, 82
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 369
LDI r6, 30
LDI r7, 32
LDI r8, 66
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
