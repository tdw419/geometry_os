; DESCRIPTION: Composite: Creates a blue rectangular region at (38, 110) spanning 104 by 46 pixels then Creates a green circular shape at (88, 179) with radius 63.
; PLAN: r0=38(x), r1=110(y), r2=104(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=88(x), r6=179(y), r7=63(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 38
LDI r1, 110
LDI r2, 104
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 179
LDI r7, 63
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
