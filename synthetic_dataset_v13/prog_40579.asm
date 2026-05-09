; DESCRIPTION: Composite: Sets a single yellow pixel at (51, 97) then Places a white line segment connecting (361, 105) to (155, 166) then Creates a cyan rectangular region at (272, 77) spanning 49 by 24 pixels.
; PLAN: r0=51(x), r1=97(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=361(x1), r6=105(y1), r7=155(x2), r8=166(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=272(x), r11=77(y), r12=49(width), r13=24(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 51
LDI r1, 97
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 361
LDI r6, 105
LDI r7, 155
LDI r8, 166
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 272
LDI r11, 77
LDI r12, 49
LDI r13, 24
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
