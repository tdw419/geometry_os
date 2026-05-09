; DESCRIPTION: Composite: Places a cyan line segment connecting (147, 105) to (507, 46) then Creates a cyan rectangular region at (187, 18) spanning 29 by 56 pixels then Creates a yellow circular shape at (224, 89) with radius 33.
; PLAN: r0=147(x1), r1=105(y1), r2=507(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=187(x), r6=18(y), r7=29(width), r8=56(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=224(x), r11=89(y), r12=33(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 147
LDI r1, 105
LDI r2, 507
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 18
LDI r7, 29
LDI r8, 56
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 224
LDI r11, 89
LDI r12, 33
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
