; DESCRIPTION: Composite: Renders a orange box of size 33x43 starting at (353, 81) then Creates a black circular shape at (145, 136) with radius 52 then Sets a single yellow pixel at (162, 135).
; PLAN: r0=353(x), r1=81(y), r2=33(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=145(x), r6=136(y), r7=52(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=162(x), r11=135(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 353
LDI r1, 81
LDI r2, 33
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 136
LDI r7, 52
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 162
LDI r11, 135
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
