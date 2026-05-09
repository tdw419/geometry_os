; DESCRIPTION: Composite: Creates a purple rectangular region at (159, 91) spanning 44 by 55 pixels then Places a orange dot at position (68, 251) then Places a white line segment connecting (409, 199) to (253, 145).
; PLAN: r0=159(x), r1=91(y), r2=44(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=68(x), r6=251(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=409(x1), r11=199(y1), r12=253(x2), r13=145(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 159
LDI r1, 91
LDI r2, 44
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 251
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 409
LDI r11, 199
LDI r12, 253
LDI r13, 145
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
