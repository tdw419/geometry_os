; DESCRIPTION: Composite: Renders a blue line between points (53, 90) and (366, 217) then Creates a cyan rectangular region at (448, 25) spanning 44 by 26 pixels then Creates a orange circular shape at (239, 144) with radius 47.
; PLAN: r0=53(x1), r1=90(y1), r2=366(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=448(x), r6=25(y), r7=44(width), r8=26(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=239(x), r11=144(y), r12=47(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 53
LDI r1, 90
LDI r2, 366
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 25
LDI r7, 44
LDI r8, 26
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 239
LDI r11, 144
LDI r12, 47
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
