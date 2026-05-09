; DESCRIPTION: Composite: Sets a single black pixel at (501, 126) then Places a green line segment connecting (485, 165) to (439, 101) then Renders a yellow box of size 114x37 starting at (166, 34).
; PLAN: r0=501(x), r1=126(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=485(x1), r6=165(y1), r7=439(x2), r8=101(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=166(x), r11=34(y), r12=114(width), r13=37(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 501
LDI r1, 126
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 485
LDI r6, 165
LDI r7, 439
LDI r8, 101
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 166
LDI r11, 34
LDI r12, 114
LDI r13, 37
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
