; DESCRIPTION: Composite: Draws a white line from (116, 116) to (475, 33) then Draws a red circle centered at (432, 109) with radius 47 then Sets a single green pixel at (75, 79).
; PLAN: r0=116(x1), r1=116(y1), r2=475(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=432(x), r6=109(y), r7=47(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=75(x), r11=79(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 116
LDI r1, 116
LDI r2, 475
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 109
LDI r7, 47
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 75
LDI r11, 79
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
