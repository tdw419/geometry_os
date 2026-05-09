; DESCRIPTION: Composite: Places a black line segment connecting (459, 134) to (239, 158) then Places a red 103x88 rectangle at position (35, 23) then Draws a red circle centered at (446, 161) with radius 35.
; PLAN: r0=459(x1), r1=134(y1), r2=239(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=35(x), r6=23(y), r7=103(width), r8=88(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=446(x), r11=161(y), r12=35(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 459
LDI r1, 134
LDI r2, 239
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 23
LDI r7, 103
LDI r8, 88
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 446
LDI r11, 161
LDI r12, 35
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
