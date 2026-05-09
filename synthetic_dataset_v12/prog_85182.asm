; DESCRIPTION: Composite: Draws a black line from (335, 241) to (489, 155) then Places a black dot at position (50, 17) then Places a green circle of radius 43 at center (67, 102).
; PLAN: r0=335(x1), r1=241(y1), r2=489(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=50(x), r6=17(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=67(x), r11=102(y), r12=43(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 335
LDI r1, 241
LDI r2, 489
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 17
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 67
LDI r11, 102
LDI r12, 43
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
