; DESCRIPTION: Composite: Creates a orange rectangular region at (104, 167) spanning 91 by 19 pixels then Sets a single yellow pixel at (309, 122) then Places a yellow line segment connecting (12, 16) to (278, 99).
; PLAN: r0=104(x), r1=167(y), r2=91(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=309(x), r6=122(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=12(x1), r11=16(y1), r12=278(x2), r13=99(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 104
LDI r1, 167
LDI r2, 91
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 122
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 12
LDI r11, 16
LDI r12, 278
LDI r13, 99
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
