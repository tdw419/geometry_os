; DESCRIPTION: Composite: Places a blue dot at position (485, 12) then Creates a green rectangular region at (161, 0) spanning 119 by 72 pixels then Places a orange line segment connecting (475, 147) to (456, 8).
; PLAN: r0=485(x), r1=12(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=161(x), r6=0(y), r7=119(width), r8=72(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=475(x1), r11=147(y1), r12=456(x2), r13=8(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 485
LDI r1, 12
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 161
LDI r6, 0
LDI r7, 119
LDI r8, 72
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 475
LDI r11, 147
LDI r12, 456
LDI r13, 8
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
