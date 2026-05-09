; DESCRIPTION: Composite: Places a purple line segment connecting (443, 14) to (315, 57) then Places a red 88x91 rectangle at position (315, 122) then Creates a yellow circular shape at (145, 81) with radius 48.
; PLAN: r0=443(x1), r1=14(y1), r2=315(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=315(x), r6=122(y), r7=88(width), r8=91(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=145(x), r11=81(y), r12=48(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 443
LDI r1, 14
LDI r2, 315
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 122
LDI r7, 88
LDI r8, 91
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 145
LDI r11, 81
LDI r12, 48
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
