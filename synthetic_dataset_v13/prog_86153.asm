; DESCRIPTION: Composite: Draws a orange circle centered at (378, 80) with radius 33 then Draws a purple line from (472, 152) to (437, 16) then Places a white dot at position (16, 125).
; PLAN: r0=378(x), r1=80(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=472(x1), r6=152(y1), r7=437(x2), r8=16(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=16(x), r11=125(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 378
LDI r1, 80
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 472
LDI r6, 152
LDI r7, 437
LDI r8, 16
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 16
LDI r11, 125
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
