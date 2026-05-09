; DESCRIPTION: Composite: Renders a orange line between points (132, 239) and (370, 28) then Renders a purple box of size 118x80 starting at (291, 34) then Creates a red circular shape at (477, 148) with radius 31.
; PLAN: r0=132(x1), r1=239(y1), r2=370(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=291(x), r6=34(y), r7=118(width), r8=80(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=477(x), r11=148(y), r12=31(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 132
LDI r1, 239
LDI r2, 370
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 34
LDI r7, 118
LDI r8, 80
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 477
LDI r11, 148
LDI r12, 31
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
