; DESCRIPTION: Composite: Places a red line segment connecting (164, 251) to (389, 113) then Renders a orange box of size 109x80 starting at (130, 27) then Renders a purple disk with center (258, 176) and radius 69.
; PLAN: r0=164(x1), r1=251(y1), r2=389(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=130(x), r6=27(y), r7=109(width), r8=80(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=258(x), r11=176(y), r12=69(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 164
LDI r1, 251
LDI r2, 389
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 27
LDI r7, 109
LDI r8, 80
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 258
LDI r11, 176
LDI r12, 69
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
