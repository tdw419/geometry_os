; DESCRIPTION: Composite: Places a green circle of radius 22 at center (255, 37) then Draws a black rectangle at (220, 175) with width 45 and height 70 then Places a yellow line segment connecting (85, 42) to (399, 239).
; PLAN: r0=255(x), r1=37(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=220(x), r6=175(y), r7=45(width), r8=70(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=85(x1), r11=42(y1), r12=399(x2), r13=239(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 255
LDI r1, 37
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 220
LDI r6, 175
LDI r7, 45
LDI r8, 70
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 85
LDI r11, 42
LDI r12, 399
LDI r13, 239
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
