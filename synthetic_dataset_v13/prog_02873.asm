; DESCRIPTION: Composite: Draws a orange line from (505, 115) to (23, 240) then Draws a white rectangle at (119, 44) with width 93 and height 69 then Creates a red circular shape at (356, 131) with radius 70.
; PLAN: r0=505(x1), r1=115(y1), r2=23(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=119(x), r6=44(y), r7=93(width), r8=69(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=356(x), r11=131(y), r12=70(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 505
LDI r1, 115
LDI r2, 23
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 44
LDI r7, 93
LDI r8, 69
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 131
LDI r12, 70
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
