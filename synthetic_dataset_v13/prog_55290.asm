; DESCRIPTION: Composite: Places a black line segment connecting (281, 142) to (255, 104) then Renders a blue box of size 57x51 starting at (151, 59) then Draws a orange circle centered at (386, 161) with radius 53.
; PLAN: r0=281(x1), r1=142(y1), r2=255(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=151(x), r6=59(y), r7=57(width), r8=51(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=386(x), r11=161(y), r12=53(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 281
LDI r1, 142
LDI r2, 255
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 59
LDI r7, 57
LDI r8, 51
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 386
LDI r11, 161
LDI r12, 53
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
