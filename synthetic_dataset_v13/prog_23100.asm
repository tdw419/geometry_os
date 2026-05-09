; DESCRIPTION: Composite: Places a green line segment connecting (462, 97) to (294, 0) then Places a cyan circle of radius 37 at center (157, 135) then Draws a orange rectangle at (183, 100) with width 14 and height 55.
; PLAN: r0=462(x1), r1=97(y1), r2=294(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=157(x), r6=135(y), r7=37(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=183(x), r11=100(y), r12=14(width), r13=55(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 462
LDI r1, 97
LDI r2, 294
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 135
LDI r7, 37
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 183
LDI r11, 100
LDI r12, 14
LDI r13, 55
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
