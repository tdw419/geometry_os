; DESCRIPTION: Composite: Draws a purple line from (56, 149) to (486, 88) then Renders a yellow box of size 27x73 starting at (59, 90) then Draws a red circle centered at (184, 161) with radius 30.
; PLAN: r0=56(x1), r1=149(y1), r2=486(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=59(x), r6=90(y), r7=27(width), r8=73(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=184(x), r11=161(y), r12=30(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 56
LDI r1, 149
LDI r2, 486
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 90
LDI r7, 27
LDI r8, 73
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 184
LDI r11, 161
LDI r12, 30
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
