; DESCRIPTION: Composite: Places a yellow circle of radius 65 at center (333, 128) then Creates a cyan rectangular region at (360, 88) spanning 68 by 67 pixels then Places a white dot at position (316, 132).
; PLAN: r0=333(x), r1=128(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=360(x), r6=88(y), r7=68(width), r8=67(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=316(x), r11=132(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 333
LDI r1, 128
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 360
LDI r6, 88
LDI r7, 68
LDI r8, 67
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 316
LDI r11, 132
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
