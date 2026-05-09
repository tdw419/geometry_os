; DESCRIPTION: Composite: Places a black 45x30 rectangle at position (23, 19) then Creates a black circular shape at (421, 121) with radius 20 then Places a red line segment connecting (211, 110) to (275, 95).
; PLAN: r0=23(x), r1=19(y), r2=45(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=421(x), r6=121(y), r7=20(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=211(x1), r11=110(y1), r12=275(x2), r13=95(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 23
LDI r1, 19
LDI r2, 45
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 121
LDI r7, 20
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 211
LDI r11, 110
LDI r12, 275
LDI r13, 95
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
