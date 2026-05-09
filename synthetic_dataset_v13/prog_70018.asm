; DESCRIPTION: Composite: Renders a orange box of size 90x47 starting at (236, 114) then Renders a white line between points (130, 66) and (78, 218) then Draws a blue circle centered at (178, 55) with radius 37.
; PLAN: r0=236(x), r1=114(y), r2=90(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x1), r6=66(y1), r7=78(x2), r8=218(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=178(x), r11=55(y), r12=37(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 236
LDI r1, 114
LDI r2, 90
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 66
LDI r7, 78
LDI r8, 218
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 178
LDI r11, 55
LDI r12, 37
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
