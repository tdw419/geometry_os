; DESCRIPTION: Composite: Places a orange circle of radius 10 at center (186, 88) then Creates a cyan rectangular region at (266, 53) spanning 66 by 75 pixels then Sets a single yellow pixel at (74, 102).
; PLAN: r0=186(x), r1=88(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=266(x), r6=53(y), r7=66(width), r8=75(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=74(x), r11=102(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 186
LDI r1, 88
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 266
LDI r6, 53
LDI r7, 66
LDI r8, 75
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 74
LDI r11, 102
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
