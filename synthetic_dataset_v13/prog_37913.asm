; DESCRIPTION: Composite: Draws a cyan rectangle at (31, 1) with width 41 and height 116 then Draws a red line from (474, 251) to (104, 17) then Sets a single orange pixel at (346, 79).
; PLAN: r0=31(x), r1=1(y), r2=41(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=474(x1), r6=251(y1), r7=104(x2), r8=17(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=346(x), r11=79(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 31
LDI r1, 1
LDI r2, 41
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 251
LDI r7, 104
LDI r8, 17
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 346
LDI r11, 79
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
