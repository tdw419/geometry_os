; DESCRIPTION: Composite: Creates a yellow circular shape at (383, 184) with radius 69 then Places a purple line segment connecting (225, 108) to (341, 93) then Draws a white rectangle at (117, 147) with width 92 and height 73.
; PLAN: r0=383(x), r1=184(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=225(x1), r6=108(y1), r7=341(x2), r8=93(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=117(x), r11=147(y), r12=92(width), r13=73(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 184
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 225
LDI r6, 108
LDI r7, 341
LDI r8, 93
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 117
LDI r11, 147
LDI r12, 92
LDI r13, 73
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
