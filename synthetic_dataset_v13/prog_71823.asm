; DESCRIPTION: Composite: Places a orange line segment connecting (360, 0) to (442, 168) then Places a purple circle of radius 61 at center (386, 155) then Draws a blue rectangle at (250, 112) with width 35 and height 72.
; PLAN: r0=360(x1), r1=0(y1), r2=442(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=386(x), r6=155(y), r7=61(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=250(x), r11=112(y), r12=35(width), r13=72(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 0
LDI r2, 442
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 155
LDI r7, 61
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 250
LDI r11, 112
LDI r12, 35
LDI r13, 72
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
