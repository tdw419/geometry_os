; DESCRIPTION: Composite: Places a red line segment connecting (20, 9) to (383, 94) then Draws a purple rectangle at (60, 116) with width 108 and height 76 then Places a yellow circle of radius 62 at center (141, 102).
; PLAN: r0=20(x1), r1=9(y1), r2=383(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=60(x), r6=116(y), r7=108(width), r8=76(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=141(x), r11=102(y), r12=62(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 20
LDI r1, 9
LDI r2, 383
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 116
LDI r7, 108
LDI r8, 76
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 141
LDI r11, 102
LDI r12, 62
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
