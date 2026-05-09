; DESCRIPTION: Composite: Places a orange 10x20 rectangle at position (134, 5) then Sets a single red pixel at (17, 103) then Creates a yellow circular shape at (22, 55) with radius 16.
; PLAN: r0=134(x), r1=5(y), r2=10(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=17(x), r6=103(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=22(x), r11=55(y), r12=16(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 134
LDI r1, 5
LDI r2, 10
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 103
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 22
LDI r11, 55
LDI r12, 16
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
