; DESCRIPTION: Composite: Places a black circle of radius 78 at center (285, 149) then Places a orange 93x65 rectangle at position (248, 40) then Sets a single yellow pixel at (34, 4).
; PLAN: r0=285(x), r1=149(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=248(x), r6=40(y), r7=93(width), r8=65(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=34(x), r11=4(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 285
LDI r1, 149
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 248
LDI r6, 40
LDI r7, 93
LDI r8, 65
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 34
LDI r11, 4
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
