; DESCRIPTION: Composite: Places a white circle of radius 69 at center (207, 157) then Places a orange line segment connecting (106, 68) to (271, 91) then Renders a red box of size 61x12 starting at (55, 41).
; PLAN: r0=207(x), r1=157(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=106(x1), r6=68(y1), r7=271(x2), r8=91(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=55(x), r11=41(y), r12=61(width), r13=12(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 207
LDI r1, 157
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 106
LDI r6, 68
LDI r7, 271
LDI r8, 91
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 55
LDI r11, 41
LDI r12, 61
LDI r13, 12
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
