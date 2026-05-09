; DESCRIPTION: Composite: Draws a orange rectangle at (33, 73) with width 56 and height 37 then Draws a black line from (278, 13) to (432, 174) then Sets a single green pixel at (469, 70).
; PLAN: r0=33(x), r1=73(y), r2=56(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x1), r6=13(y1), r7=432(x2), r8=174(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=469(x), r11=70(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 33
LDI r1, 73
LDI r2, 56
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 13
LDI r7, 432
LDI r8, 174
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 469
LDI r11, 70
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
