; DESCRIPTION: Composite: Creates a purple rectangular region at (112, 185) spanning 109 by 39 pixels then Sets a single cyan pixel at (366, 182) then Draws a blue line from (200, 3) to (62, 130).
; PLAN: r0=112(x), r1=185(y), r2=109(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=366(x), r6=182(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=200(x1), r11=3(y1), r12=62(x2), r13=130(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 112
LDI r1, 185
LDI r2, 109
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 182
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 200
LDI r11, 3
LDI r12, 62
LDI r13, 130
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
