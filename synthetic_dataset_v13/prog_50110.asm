; DESCRIPTION: Composite: Sets a single green pixel at (102, 110) then Creates a cyan rectangular region at (66, 49) spanning 88 by 52 pixels then Places a green line segment connecting (149, 156) to (215, 193).
; PLAN: r0=102(x), r1=110(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=66(x), r6=49(y), r7=88(width), r8=52(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=149(x1), r11=156(y1), r12=215(x2), r13=193(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 102
LDI r1, 110
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 66
LDI r6, 49
LDI r7, 88
LDI r8, 52
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 149
LDI r11, 156
LDI r12, 215
LDI r13, 193
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
