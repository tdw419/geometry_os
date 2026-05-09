; DESCRIPTION: Composite: Places a magenta line segment connecting (331, 119) to (17, 200) then Creates a magenta rectangular region at (462, 42) spanning 28 by 43 pixels then Places a white dot at position (268, 2).
; PLAN: r0=331(x1), r1=119(y1), r2=17(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=462(x), r6=42(y), r7=28(width), r8=43(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=268(x), r11=2(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 331
LDI r1, 119
LDI r2, 17
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 42
LDI r7, 28
LDI r8, 43
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 268
LDI r11, 2
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
