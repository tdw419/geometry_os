; DESCRIPTION: Composite: Places a cyan circle of radius 31 at center (232, 38) then Draws a white rectangle at (426, 100) with width 12 and height 69 then Places a orange line segment connecting (415, 170) to (99, 43).
; PLAN: r0=232(x), r1=38(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=426(x), r6=100(y), r7=12(width), r8=69(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=415(x1), r11=170(y1), r12=99(x2), r13=43(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 38
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 426
LDI r6, 100
LDI r7, 12
LDI r8, 69
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 415
LDI r11, 170
LDI r12, 99
LDI r13, 43
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
