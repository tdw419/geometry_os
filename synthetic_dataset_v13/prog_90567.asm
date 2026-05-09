; DESCRIPTION: Composite: Sets a single purple pixel at (430, 178) then Draws a red line from (441, 171) to (99, 31) then Draws a blue circle centered at (93, 70) with radius 40.
; PLAN: r0=430(x), r1=178(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=441(x1), r6=171(y1), r7=99(x2), r8=31(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=93(x), r11=70(y), r12=40(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 430
LDI r1, 178
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 441
LDI r6, 171
LDI r7, 99
LDI r8, 31
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 93
LDI r11, 70
LDI r12, 40
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
