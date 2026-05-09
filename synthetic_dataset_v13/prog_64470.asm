; DESCRIPTION: Composite: Draws a cyan line from (47, 248) to (217, 193) then Sets a single orange pixel at (175, 25) then Places a orange circle of radius 73 at center (183, 147).
; PLAN: r0=47(x1), r1=248(y1), r2=217(x2), r3=193(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=25(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=183(x), r11=147(y), r12=73(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 47
LDI r1, 248
LDI r2, 217
LDI r3, 193
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 25
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 183
LDI r11, 147
LDI r12, 73
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
