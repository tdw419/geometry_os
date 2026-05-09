; DESCRIPTION: Composite: Places a magenta 102x96 rectangle at position (303, 46) then Places a cyan line segment connecting (319, 250) to (351, 145) then Sets a single magenta pixel at (266, 91).
; PLAN: r0=303(x), r1=46(y), r2=102(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x1), r6=250(y1), r7=351(x2), r8=145(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=266(x), r11=91(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 303
LDI r1, 46
LDI r2, 102
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 250
LDI r7, 351
LDI r8, 145
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 266
LDI r11, 91
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
