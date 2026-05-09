; DESCRIPTION: Composite: Places a orange dot at position (341, 186) then Places a magenta line segment connecting (117, 247) to (229, 15) then Renders a white box of size 26x95 starting at (316, 149).
; PLAN: r0=341(x), r1=186(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=117(x1), r6=247(y1), r7=229(x2), r8=15(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=316(x), r11=149(y), r12=26(width), r13=95(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 341
LDI r1, 186
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 117
LDI r6, 247
LDI r7, 229
LDI r8, 15
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 316
LDI r11, 149
LDI r12, 26
LDI r13, 95
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
