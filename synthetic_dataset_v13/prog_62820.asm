; DESCRIPTION: Composite: Draws a green line from (173, 110) to (37, 0) then Renders a orange box of size 39x43 starting at (166, 5) then Draws a blue circle centered at (221, 100) with radius 79.
; PLAN: r0=173(x1), r1=110(y1), r2=37(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=166(x), r6=5(y), r7=39(width), r8=43(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=221(x), r11=100(y), r12=79(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 173
LDI r1, 110
LDI r2, 37
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 5
LDI r7, 39
LDI r8, 43
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 221
LDI r11, 100
LDI r12, 79
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
