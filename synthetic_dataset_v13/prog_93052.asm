; DESCRIPTION: Composite: Draws a cyan rectangle at (202, 37) with width 95 and height 69 then Creates a yellow circular shape at (244, 157) with radius 52 then Sets a single red pixel at (222, 10).
; PLAN: r0=202(x), r1=37(y), r2=95(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=244(x), r6=157(y), r7=52(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=222(x), r11=10(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 202
LDI r1, 37
LDI r2, 95
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 157
LDI r7, 52
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 222
LDI r11, 10
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
