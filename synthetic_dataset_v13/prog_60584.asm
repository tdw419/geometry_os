; DESCRIPTION: Composite: Sets a single red pixel at (93, 216) then Creates a orange rectangular region at (407, 76) spanning 22 by 16 pixels then Creates a cyan circular shape at (428, 129) with radius 69.
; PLAN: r0=93(x), r1=216(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=407(x), r6=76(y), r7=22(width), r8=16(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=428(x), r11=129(y), r12=69(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 93
LDI r1, 216
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 407
LDI r6, 76
LDI r7, 22
LDI r8, 16
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 428
LDI r11, 129
LDI r12, 69
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
