; DESCRIPTION: Composite: Sets a single black pixel at (123, 69) then Renders a red box of size 96x67 starting at (53, 84) then Places a red line segment connecting (20, 121) to (457, 70).
; PLAN: r0=123(x), r1=69(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=53(x), r6=84(y), r7=96(width), r8=67(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=20(x1), r11=121(y1), r12=457(x2), r13=70(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 69
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 53
LDI r6, 84
LDI r7, 96
LDI r8, 67
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 20
LDI r11, 121
LDI r12, 457
LDI r13, 70
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
