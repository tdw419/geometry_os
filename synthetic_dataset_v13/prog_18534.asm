; DESCRIPTION: Composite: Sets a single green pixel at (293, 25) then Renders a green box of size 44x119 starting at (85, 83) then Draws a orange line from (187, 78) to (453, 122).
; PLAN: r0=293(x), r1=25(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=85(x), r6=83(y), r7=44(width), r8=119(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=187(x1), r11=78(y1), r12=453(x2), r13=122(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 293
LDI r1, 25
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 85
LDI r6, 83
LDI r7, 44
LDI r8, 119
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 78
LDI r12, 453
LDI r13, 122
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
