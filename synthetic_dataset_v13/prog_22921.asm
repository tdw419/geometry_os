; DESCRIPTION: Composite: Sets a single yellow pixel at (391, 224) then Places a orange line segment connecting (189, 175) to (339, 203) then Renders a yellow box of size 115x114 starting at (160, 124).
; PLAN: r0=391(x), r1=224(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=189(x1), r6=175(y1), r7=339(x2), r8=203(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=160(x), r11=124(y), r12=115(width), r13=114(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 391
LDI r1, 224
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 189
LDI r6, 175
LDI r7, 339
LDI r8, 203
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 160
LDI r11, 124
LDI r12, 115
LDI r13, 114
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
