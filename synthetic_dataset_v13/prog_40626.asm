; DESCRIPTION: Composite: Creates a orange circular shape at (358, 174) with radius 79 then Sets a single black pixel at (381, 112) then Creates a blue rectangular region at (112, 7) spanning 85 by 54 pixels.
; PLAN: r0=358(x), r1=174(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=381(x), r6=112(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=112(x), r11=7(y), r12=85(width), r13=54(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 358
LDI r1, 174
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 381
LDI r6, 112
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 112
LDI r11, 7
LDI r12, 85
LDI r13, 54
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
