; DESCRIPTION: Composite: Creates a orange rectangular region at (259, 208) spanning 15 by 45 pixels then Sets a single white pixel at (490, 71) then Draws a magenta line from (194, 162) to (478, 197).
; PLAN: r0=259(x), r1=208(y), r2=15(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=490(x), r6=71(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=194(x1), r11=162(y1), r12=478(x2), r13=197(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 208
LDI r2, 15
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 71
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 194
LDI r11, 162
LDI r12, 478
LDI r13, 197
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
