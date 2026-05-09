; DESCRIPTION: Composite: Sets a single green pixel at (273, 175) then Places a orange line segment connecting (342, 153) to (49, 97) then Creates a cyan circular shape at (61, 130) with radius 42.
; PLAN: r0=273(x), r1=175(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=342(x1), r6=153(y1), r7=49(x2), r8=97(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=61(x), r11=130(y), r12=42(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 273
LDI r1, 175
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 342
LDI r6, 153
LDI r7, 49
LDI r8, 97
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 61
LDI r11, 130
LDI r12, 42
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
