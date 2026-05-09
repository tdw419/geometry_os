; DESCRIPTION: Composite: Places a orange dot at position (96, 110) then Renders a yellow box of size 84x55 starting at (256, 114) then Creates a orange circular shape at (447, 162) with radius 33.
; PLAN: r0=96(x), r1=110(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=256(x), r6=114(y), r7=84(width), r8=55(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=447(x), r11=162(y), r12=33(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 96
LDI r1, 110
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 256
LDI r6, 114
LDI r7, 84
LDI r8, 55
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 447
LDI r11, 162
LDI r12, 33
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
