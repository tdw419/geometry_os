; DESCRIPTION: Composite: Creates a purple circular shape at (409, 58) with radius 23 then Creates a red rectangular region at (107, 212) spanning 100 by 41 pixels then Sets a single cyan pixel at (387, 20).
; PLAN: r0=409(x), r1=58(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=107(x), r6=212(y), r7=100(width), r8=41(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=387(x), r11=20(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 409
LDI r1, 58
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 107
LDI r6, 212
LDI r7, 100
LDI r8, 41
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 387
LDI r11, 20
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
