; DESCRIPTION: Composite: Draws a yellow line from (35, 4) to (332, 88) then Renders a orange box of size 64x83 starting at (17, 43) then Renders a red disk with center (295, 162) and radius 60.
; PLAN: r0=35(x1), r1=4(y1), r2=332(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=17(x), r6=43(y), r7=64(width), r8=83(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=295(x), r11=162(y), r12=60(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 35
LDI r1, 4
LDI r2, 332
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 43
LDI r7, 64
LDI r8, 83
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 295
LDI r11, 162
LDI r12, 60
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
