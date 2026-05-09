; DESCRIPTION: Composite: Places a orange 49x98 rectangle at position (348, 33) then Creates a orange circular shape at (302, 147) with radius 69.
; PLAN: r0=348(x), r1=33(y), r2=49(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=302(x), r6=147(y), r7=69(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 348
LDI r1, 33
LDI r2, 49
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 147
LDI r7, 69
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
