; DESCRIPTION: Composite: Places a white dot at position (298, 171) then Creates a magenta rectangular region at (10, 56) spanning 118 by 84 pixels then Places a magenta line segment connecting (227, 55) to (78, 231).
; PLAN: r0=298(x), r1=171(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=10(x), r6=56(y), r7=118(width), r8=84(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=227(x1), r11=55(y1), r12=78(x2), r13=231(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 298
LDI r1, 171
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 10
LDI r6, 56
LDI r7, 118
LDI r8, 84
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 227
LDI r11, 55
LDI r12, 78
LDI r13, 231
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
