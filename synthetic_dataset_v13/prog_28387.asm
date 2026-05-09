; DESCRIPTION: Composite: Places a orange line segment connecting (338, 43) to (232, 152) then Renders a black box of size 108x60 starting at (350, 158) then Places a white circle of radius 19 at center (213, 126).
; PLAN: r0=338(x1), r1=43(y1), r2=232(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=350(x), r6=158(y), r7=108(width), r8=60(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=213(x), r11=126(y), r12=19(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 338
LDI r1, 43
LDI r2, 232
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 158
LDI r7, 108
LDI r8, 60
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 213
LDI r11, 126
LDI r12, 19
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
