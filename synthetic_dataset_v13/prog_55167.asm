; DESCRIPTION: Composite: Creates a orange rectangular region at (143, 19) spanning 25 by 66 pixels then Renders a orange disk with center (359, 195) and radius 30 then Renders a orange line between points (138, 85) and (68, 203).
; PLAN: r0=143(x), r1=19(y), r2=25(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=359(x), r6=195(y), r7=30(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=138(x1), r11=85(y1), r12=68(x2), r13=203(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 143
LDI r1, 19
LDI r2, 25
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 195
LDI r7, 30
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 138
LDI r11, 85
LDI r12, 68
LDI r13, 203
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
