; DESCRIPTION: Composite: Places a black line segment connecting (67, 188) to (501, 165) then Places a orange dot at position (482, 30) then Renders a black disk with center (160, 174) and radius 69.
; PLAN: r0=67(x1), r1=188(y1), r2=501(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=482(x), r6=30(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=160(x), r11=174(y), r12=69(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 67
LDI r1, 188
LDI r2, 501
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 30
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 160
LDI r11, 174
LDI r12, 69
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
