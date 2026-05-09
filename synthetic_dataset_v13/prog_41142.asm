; DESCRIPTION: Composite: Sets a single yellow pixel at (510, 46) then Places a orange line segment connecting (375, 47) to (65, 69) then Creates a red rectangular region at (115, 49) spanning 31 by 64 pixels.
; PLAN: r0=510(x), r1=46(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=375(x1), r6=47(y1), r7=65(x2), r8=69(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=115(x), r11=49(y), r12=31(width), r13=64(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 510
LDI r1, 46
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 375
LDI r6, 47
LDI r7, 65
LDI r8, 69
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 115
LDI r11, 49
LDI r12, 31
LDI r13, 64
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
