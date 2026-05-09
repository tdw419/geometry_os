; DESCRIPTION: Composite: Places a green dot at position (357, 26) then Places a magenta 69x41 rectangle at position (128, 98) then Places a orange line segment connecting (81, 110) to (349, 166).
; PLAN: r0=357(x), r1=26(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=128(x), r6=98(y), r7=69(width), r8=41(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=81(x1), r11=110(y1), r12=349(x2), r13=166(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 357
LDI r1, 26
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 128
LDI r6, 98
LDI r7, 69
LDI r8, 41
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 81
LDI r11, 110
LDI r12, 349
LDI r13, 166
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
