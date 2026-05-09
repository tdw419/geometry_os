; DESCRIPTION: Composite: Draws a purple line from (363, 67) to (105, 3) then Creates a orange rectangular region at (75, 209) spanning 92 by 35 pixels then Sets a single white pixel at (411, 211).
; PLAN: r0=363(x1), r1=67(y1), r2=105(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=75(x), r6=209(y), r7=92(width), r8=35(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=411(x), r11=211(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 363
LDI r1, 67
LDI r2, 105
LDI r3, 3
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 209
LDI r7, 92
LDI r8, 35
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 411
LDI r11, 211
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
