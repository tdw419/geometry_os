; DESCRIPTION: Composite: Places a green line segment connecting (381, 131) to (458, 230) then Places a orange dot at position (78, 55) then Creates a black rectangular region at (438, 38) spanning 66 by 76 pixels.
; PLAN: r0=381(x1), r1=131(y1), r2=458(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=78(x), r6=55(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=438(x), r11=38(y), r12=66(width), r13=76(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 131
LDI r2, 458
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 55
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 438
LDI r11, 38
LDI r12, 66
LDI r13, 76
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
