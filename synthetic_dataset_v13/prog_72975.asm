; DESCRIPTION: Composite: Places a green dot at position (40, 78) then Creates a red rectangular region at (214, 195) spanning 114 by 23 pixels then Places a white line segment connecting (145, 69) to (62, 178).
; PLAN: r0=40(x), r1=78(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=214(x), r6=195(y), r7=114(width), r8=23(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=145(x1), r11=69(y1), r12=62(x2), r13=178(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 40
LDI r1, 78
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 214
LDI r6, 195
LDI r7, 114
LDI r8, 23
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 145
LDI r11, 69
LDI r12, 62
LDI r13, 178
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
