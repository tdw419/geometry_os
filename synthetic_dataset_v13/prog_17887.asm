; DESCRIPTION: Composite: Draws a cyan line from (416, 31) to (362, 198) then Draws a cyan circle centered at (469, 208) with radius 26 then Sets a single green pixel at (104, 41).
; PLAN: r0=416(x1), r1=31(y1), r2=362(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=469(x), r6=208(y), r7=26(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=104(x), r11=41(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 416
LDI r1, 31
LDI r2, 362
LDI r3, 198
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 208
LDI r7, 26
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 104
LDI r11, 41
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
