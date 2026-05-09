; DESCRIPTION: Composite: Creates a cyan rectangular region at (124, 163) spanning 115 by 68 pixels then Places a orange line segment connecting (78, 173) to (476, 227) then Sets a single yellow pixel at (18, 228).
; PLAN: r0=124(x), r1=163(y), r2=115(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=78(x1), r6=173(y1), r7=476(x2), r8=227(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=18(x), r11=228(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 124
LDI r1, 163
LDI r2, 115
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 173
LDI r7, 476
LDI r8, 227
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 18
LDI r11, 228
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
