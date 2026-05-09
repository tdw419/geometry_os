; DESCRIPTION: Composite: Places a white 31x63 rectangle at position (201, 88) then Draws a yellow circle centered at (58, 90) with radius 55.
; PLAN: r0=201(x), r1=88(y), r2=31(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=58(x), r6=90(y), r7=55(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 201
LDI r1, 88
LDI r2, 31
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 90
LDI r7, 55
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
