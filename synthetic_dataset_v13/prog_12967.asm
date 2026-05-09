; DESCRIPTION: Composite: Draws a yellow rectangle at (430, 116) with width 26 and height 104 then Sets a single cyan pixel at (31, 39).
; PLAN: r0=430(x), r1=116(y), r2=26(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=31(x), r6=39(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 430
LDI r1, 116
LDI r2, 26
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 39
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
