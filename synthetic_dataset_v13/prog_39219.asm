; DESCRIPTION: Composite: Creates a orange rectangular region at (11, 134) spanning 46 by 27 pixels then Sets a single blue pixel at (378, 216) then Places a yellow line segment connecting (134, 106) to (183, 65).
; PLAN: r0=11(x), r1=134(y), r2=46(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=378(x), r6=216(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=134(x1), r11=106(y1), r12=183(x2), r13=65(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 11
LDI r1, 134
LDI r2, 46
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 216
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 134
LDI r11, 106
LDI r12, 183
LDI r13, 65
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
