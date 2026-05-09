; DESCRIPTION: Composite: Sets a single white pixel at (499, 240) then Places a orange line segment connecting (232, 65) to (430, 134) then Creates a blue rectangular region at (17, 157) spanning 24 by 50 pixels.
; PLAN: r0=499(x), r1=240(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=232(x1), r6=65(y1), r7=430(x2), r8=134(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=17(x), r11=157(y), r12=24(width), r13=50(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 499
LDI r1, 240
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 232
LDI r6, 65
LDI r7, 430
LDI r8, 134
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 17
LDI r11, 157
LDI r12, 24
LDI r13, 50
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
