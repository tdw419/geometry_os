; DESCRIPTION: Composite: Places a blue circle of radius 47 at center (185, 154) then Renders a green box of size 105x50 starting at (305, 91) then Draws a orange line from (170, 33) to (492, 100).
; PLAN: r0=185(x), r1=154(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x), r6=91(y), r7=105(width), r8=50(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=170(x1), r11=33(y1), r12=492(x2), r13=100(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 185
LDI r1, 154
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 91
LDI r7, 105
LDI r8, 50
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 170
LDI r11, 33
LDI r12, 492
LDI r13, 100
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
