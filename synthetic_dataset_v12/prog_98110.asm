; DESCRIPTION: Composite: Creates a cyan rectangular region at (22, 21) spanning 41 by 117 pixels then Sets a single yellow pixel at (387, 102) then Creates a cyan circular shape at (129, 67) with radius 60.
; PLAN: r0=22(x), r1=21(y), r2=41(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=387(x), r6=102(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=129(x), r11=67(y), r12=60(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 22
LDI r1, 21
LDI r2, 41
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 102
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 129
LDI r11, 67
LDI r12, 60
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
