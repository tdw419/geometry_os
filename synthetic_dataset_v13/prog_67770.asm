; DESCRIPTION: Composite: Renders a red box of size 50x32 starting at (2, 29) then Places a blue line segment connecting (56, 149) to (360, 97) then Draws a white circle centered at (353, 159) with radius 51.
; PLAN: r0=2(x), r1=29(y), r2=50(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=56(x1), r6=149(y1), r7=360(x2), r8=97(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=353(x), r11=159(y), r12=51(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 2
LDI r1, 29
LDI r2, 50
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 149
LDI r7, 360
LDI r8, 97
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 159
LDI r12, 51
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
