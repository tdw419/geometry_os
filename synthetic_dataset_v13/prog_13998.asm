; DESCRIPTION: Composite: Renders a yellow box of size 26x88 starting at (454, 66) then Creates a orange circular shape at (102, 110) with radius 40.
; PLAN: r0=454(x), r1=66(y), r2=26(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=102(x), r6=110(y), r7=40(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 454
LDI r1, 66
LDI r2, 26
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 110
LDI r7, 40
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
