; DESCRIPTION: Composite: Draws a cyan circle centered at (353, 171) with radius 73 then Draws a cyan line from (378, 79) to (77, 8) then Sets a single orange pixel at (230, 145).
; PLAN: r0=353(x), r1=171(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=378(x1), r6=79(y1), r7=77(x2), r8=8(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=230(x), r11=145(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 353
LDI r1, 171
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 378
LDI r6, 79
LDI r7, 77
LDI r8, 8
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 230
LDI r11, 145
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
