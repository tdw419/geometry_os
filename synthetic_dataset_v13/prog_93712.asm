; DESCRIPTION: Composite: Draws a red rectangle at (172, 123) with width 73 and height 12 then Places a white line segment connecting (240, 194) to (16, 200) then Renders a blue disk with center (161, 115) and radius 67.
; PLAN: r0=172(x), r1=123(y), r2=73(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x1), r6=194(y1), r7=16(x2), r8=200(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=161(x), r11=115(y), r12=67(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 172
LDI r1, 123
LDI r2, 73
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 194
LDI r7, 16
LDI r8, 200
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 115
LDI r12, 67
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
