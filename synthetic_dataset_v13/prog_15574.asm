; DESCRIPTION: Composite: Places a green line segment connecting (225, 230) to (53, 22) then Draws a black rectangle at (305, 111) with width 15 and height 53 then Creates a purple circular shape at (182, 218) with radius 38.
; PLAN: r0=225(x1), r1=230(y1), r2=53(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=305(x), r6=111(y), r7=15(width), r8=53(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=182(x), r11=218(y), r12=38(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 225
LDI r1, 230
LDI r2, 53
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 111
LDI r7, 15
LDI r8, 53
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 182
LDI r11, 218
LDI r12, 38
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
