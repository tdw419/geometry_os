; DESCRIPTION: Composite: Draws a yellow rectangle at (61, 31) with width 105 and height 47 then Draws a yellow line from (141, 225) to (237, 175) then Places a black circle of radius 56 at center (76, 98).
; PLAN: r0=61(x), r1=31(y), r2=105(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=141(x1), r6=225(y1), r7=237(x2), r8=175(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=76(x), r11=98(y), r12=56(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 61
LDI r1, 31
LDI r2, 105
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 225
LDI r7, 237
LDI r8, 175
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 98
LDI r12, 56
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
