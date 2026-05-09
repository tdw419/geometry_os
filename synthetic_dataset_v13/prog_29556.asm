; DESCRIPTION: Composite: Draws a orange line from (390, 115) to (55, 148) then Renders a magenta box of size 70x10 starting at (164, 70) then Renders a cyan disk with center (91, 112) and radius 78.
; PLAN: r0=390(x1), r1=115(y1), r2=55(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=70(y), r7=70(width), r8=10(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=91(x), r11=112(y), r12=78(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 390
LDI r1, 115
LDI r2, 55
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 70
LDI r7, 70
LDI r8, 10
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 91
LDI r11, 112
LDI r12, 78
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
