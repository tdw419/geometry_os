; DESCRIPTION: Composite: Creates a black circular shape at (169, 88) with radius 74 then Creates a white rectangular region at (223, 200) spanning 84 by 38 pixels.
; PLAN: r0=169(x), r1=88(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=223(x), r6=200(y), r7=84(width), r8=38(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 169
LDI r1, 88
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 223
LDI r6, 200
LDI r7, 84
LDI r8, 38
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
