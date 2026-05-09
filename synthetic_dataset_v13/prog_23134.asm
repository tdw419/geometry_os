; DESCRIPTION: Composite: Places a orange line segment connecting (420, 65) to (499, 203) then Creates a black circular shape at (340, 116) with radius 48 then Creates a cyan rectangular region at (159, 183) spanning 97 by 37 pixels.
; PLAN: r0=420(x1), r1=65(y1), r2=499(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=340(x), r6=116(y), r7=48(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=159(x), r11=183(y), r12=97(width), r13=37(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 420
LDI r1, 65
LDI r2, 499
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 116
LDI r7, 48
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 159
LDI r11, 183
LDI r12, 97
LDI r13, 37
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
