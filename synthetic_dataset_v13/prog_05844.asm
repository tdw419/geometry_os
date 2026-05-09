; DESCRIPTION: Composite: Places a yellow line segment connecting (139, 159) to (309, 107) then Places a orange dot at position (218, 134) then Creates a purple rectangular region at (299, 38) spanning 17 by 28 pixels.
; PLAN: r0=139(x1), r1=159(y1), r2=309(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=218(x), r6=134(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=299(x), r11=38(y), r12=17(width), r13=28(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 139
LDI r1, 159
LDI r2, 309
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 134
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 299
LDI r11, 38
LDI r12, 17
LDI r13, 28
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
