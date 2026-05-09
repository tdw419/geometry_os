; DESCRIPTION: Composite: Creates a yellow rectangular region at (236, 81) spanning 58 by 29 pixels then Sets a single purple pixel at (264, 125) then Creates a orange circular shape at (46, 178) with radius 11.
; PLAN: r0=236(x), r1=81(y), r2=58(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=264(x), r6=125(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=46(x), r11=178(y), r12=11(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 236
LDI r1, 81
LDI r2, 58
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 125
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 46
LDI r11, 178
LDI r12, 11
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
