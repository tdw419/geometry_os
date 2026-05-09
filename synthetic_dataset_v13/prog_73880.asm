; DESCRIPTION: Composite: Draws a blue circle centered at (98, 81) with radius 11 then Creates a black rectangular region at (48, 227) spanning 120 by 11 pixels.
; PLAN: r0=98(x), r1=81(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x), r6=227(y), r7=120(width), r8=11(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 81
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 227
LDI r7, 120
LDI r8, 11
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
