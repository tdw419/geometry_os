; DESCRIPTION: Composite: Creates a orange rectangular region at (398, 162) spanning 105 by 12 pixels then Places a black line segment connecting (75, 168) to (166, 216) then Creates a cyan circular shape at (275, 175) with radius 75.
; PLAN: r0=398(x), r1=162(y), r2=105(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=75(x1), r6=168(y1), r7=166(x2), r8=216(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=275(x), r11=175(y), r12=75(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 398
LDI r1, 162
LDI r2, 105
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 168
LDI r7, 166
LDI r8, 216
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 275
LDI r11, 175
LDI r12, 75
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
