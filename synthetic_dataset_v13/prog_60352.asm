; DESCRIPTION: Composite: Sets a single purple pixel at (15, 63) then Creates a orange rectangular region at (278, 106) spanning 98 by 23 pixels then Renders a orange line between points (497, 241) and (291, 51).
; PLAN: r0=15(x), r1=63(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=278(x), r6=106(y), r7=98(width), r8=23(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=497(x1), r11=241(y1), r12=291(x2), r13=51(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 15
LDI r1, 63
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 278
LDI r6, 106
LDI r7, 98
LDI r8, 23
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 497
LDI r11, 241
LDI r12, 291
LDI r13, 51
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
