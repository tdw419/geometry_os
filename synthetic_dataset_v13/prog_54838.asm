; DESCRIPTION: Composite: Draws a cyan line from (112, 60) to (351, 35) then Places a orange 84x80 rectangle at position (2, 71) then Sets a single black pixel at (233, 240).
; PLAN: r0=112(x1), r1=60(y1), r2=351(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=2(x), r6=71(y), r7=84(width), r8=80(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=233(x), r11=240(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 112
LDI r1, 60
LDI r2, 351
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 2
LDI r6, 71
LDI r7, 84
LDI r8, 80
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 240
LDI r12, 0x000000
PSET r10, r11, r12
HALT
