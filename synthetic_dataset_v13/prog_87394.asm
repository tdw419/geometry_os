; DESCRIPTION: Composite: Draws a purple line from (39, 218) to (165, 203) then Draws a white rectangle at (467, 113) with width 18 and height 49 then Sets a single black pixel at (248, 199).
; PLAN: r0=39(x1), r1=218(y1), r2=165(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=467(x), r6=113(y), r7=18(width), r8=49(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=248(x), r11=199(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 39
LDI r1, 218
LDI r2, 165
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 113
LDI r7, 18
LDI r8, 49
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 248
LDI r11, 199
LDI r12, 0x000000
PSET r10, r11, r12
HALT
