; DESCRIPTION: Composite: Creates a black rectangular region at (266, 7) spanning 96 by 52 pixels then Places a cyan dot at position (192, 245) then Places a blue line segment connecting (149, 115) to (378, 109).
; PLAN: r0=266(x), r1=7(y), r2=96(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=192(x), r6=245(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=149(x1), r11=115(y1), r12=378(x2), r13=109(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 266
LDI r1, 7
LDI r2, 96
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 245
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 149
LDI r11, 115
LDI r12, 378
LDI r13, 109
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
