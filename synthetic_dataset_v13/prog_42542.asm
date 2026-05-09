; DESCRIPTION: Composite: Places a purple dot at position (227, 122) then Creates a purple rectangular region at (48, 57) spanning 15 by 83 pixels then Creates a yellow circular shape at (90, 164) with radius 78.
; PLAN: r0=227(x), r1=122(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=48(x), r6=57(y), r7=15(width), r8=83(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=90(x), r11=164(y), r12=78(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 227
LDI r1, 122
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 48
LDI r6, 57
LDI r7, 15
LDI r8, 83
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 164
LDI r12, 78
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
