; DESCRIPTION: Composite: Draws a purple circle centered at (97, 55) with radius 55 then Places a orange line segment connecting (314, 210) to (508, 178) then Sets a single cyan pixel at (104, 161).
; PLAN: r0=97(x), r1=55(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=314(x1), r6=210(y1), r7=508(x2), r8=178(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=104(x), r11=161(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 97
LDI r1, 55
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 314
LDI r6, 210
LDI r7, 508
LDI r8, 178
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 161
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
