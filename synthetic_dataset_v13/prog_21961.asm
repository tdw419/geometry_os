; DESCRIPTION: Composite: Sets a single yellow pixel at (166, 140) then Creates a white rectangular region at (386, 9) spanning 106 by 66 pixels then Places a magenta line segment connecting (316, 75) to (268, 134).
; PLAN: r0=166(x), r1=140(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=386(x), r6=9(y), r7=106(width), r8=66(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=316(x1), r11=75(y1), r12=268(x2), r13=134(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 140
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 386
LDI r6, 9
LDI r7, 106
LDI r8, 66
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 316
LDI r11, 75
LDI r12, 268
LDI r13, 134
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
