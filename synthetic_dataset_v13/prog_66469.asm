; DESCRIPTION: Composite: Places a black dot at position (288, 148) then Renders a red box of size 114x93 starting at (222, 104) then Places a black line segment connecting (78, 27) to (379, 36).
; PLAN: r0=288(x), r1=148(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=222(x), r6=104(y), r7=114(width), r8=93(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=78(x1), r11=27(y1), r12=379(x2), r13=36(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 288
LDI r1, 148
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 222
LDI r6, 104
LDI r7, 114
LDI r8, 93
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 78
LDI r11, 27
LDI r12, 379
LDI r13, 36
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
