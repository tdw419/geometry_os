; DESCRIPTION: Composite: Draws a cyan line from (459, 31) to (390, 153) then Places a orange 35x88 rectangle at position (381, 99) then Places a cyan dot at position (43, 116).
; PLAN: r0=459(x1), r1=31(y1), r2=390(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=381(x), r6=99(y), r7=35(width), r8=88(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=43(x), r11=116(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 459
LDI r1, 31
LDI r2, 390
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 99
LDI r7, 35
LDI r8, 88
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 43
LDI r11, 116
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
