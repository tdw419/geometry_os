; DESCRIPTION: Composite: Places a white line segment connecting (297, 17) to (423, 28) then Renders a red box of size 90x89 starting at (324, 153) then Renders a orange disk with center (152, 178) and radius 59.
; PLAN: r0=297(x1), r1=17(y1), r2=423(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=153(y), r7=90(width), r8=89(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=152(x), r11=178(y), r12=59(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 297
LDI r1, 17
LDI r2, 423
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 153
LDI r7, 90
LDI r8, 89
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 152
LDI r11, 178
LDI r12, 59
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
