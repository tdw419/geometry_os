; DESCRIPTION: Composite: Places a purple 76x33 rectangle at position (172, 10) then Creates a white circular shape at (162, 181) with radius 40.
; PLAN: r0=172(x), r1=10(y), r2=76(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=162(x), r6=181(y), r7=40(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 172
LDI r1, 10
LDI r2, 76
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 181
LDI r7, 40
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
