; DESCRIPTION: Composite: Draws a black line from (396, 153) to (108, 88) then Renders a cyan box of size 95x69 starting at (31, 151) then Draws a orange circle centered at (360, 80) with radius 64.
; PLAN: r0=396(x1), r1=153(y1), r2=108(x2), r3=88(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=31(x), r6=151(y), r7=95(width), r8=69(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=360(x), r11=80(y), r12=64(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 396
LDI r1, 153
LDI r2, 108
LDI r3, 88
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 151
LDI r7, 95
LDI r8, 69
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 80
LDI r12, 64
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
