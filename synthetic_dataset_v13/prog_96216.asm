; DESCRIPTION: Composite: Draws a red circle centered at (391, 194) with radius 60 then Places a black line segment connecting (17, 122) to (511, 72) then Places a black 38x105 rectangle at position (295, 97).
; PLAN: r0=391(x), r1=194(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=17(x1), r6=122(y1), r7=511(x2), r8=72(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=295(x), r11=97(y), r12=38(width), r13=105(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 391
LDI r1, 194
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 17
LDI r6, 122
LDI r7, 511
LDI r8, 72
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 295
LDI r11, 97
LDI r12, 38
LDI r13, 105
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
