; DESCRIPTION: Composite: Places a blue 52x69 rectangle at position (134, 44) then Places a white line segment connecting (312, 226) to (106, 239) then Places a orange circle of radius 20 at center (472, 175).
; PLAN: r0=134(x), r1=44(y), r2=52(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=312(x1), r6=226(y1), r7=106(x2), r8=239(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=472(x), r11=175(y), r12=20(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 134
LDI r1, 44
LDI r2, 52
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 226
LDI r7, 106
LDI r8, 239
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 472
LDI r11, 175
LDI r12, 20
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
