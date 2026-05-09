; DESCRIPTION: Composite: Draws a orange line from (106, 248) to (110, 70) then Creates a white rectangular region at (227, 110) spanning 36 by 95 pixels then Places a blue dot at position (441, 121).
; PLAN: r0=106(x1), r1=248(y1), r2=110(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=110(y), r7=36(width), r8=95(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=441(x), r11=121(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 106
LDI r1, 248
LDI r2, 110
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 110
LDI r7, 36
LDI r8, 95
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 441
LDI r11, 121
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
