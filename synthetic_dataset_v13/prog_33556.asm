; DESCRIPTION: Composite: Creates a black rectangular region at (437, 83) spanning 37 by 82 pixels then Sets a single black pixel at (373, 35) then Renders a green line between points (249, 22) and (212, 49).
; PLAN: r0=437(x), r1=83(y), r2=37(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=373(x), r6=35(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=249(x1), r11=22(y1), r12=212(x2), r13=49(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 437
LDI r1, 83
LDI r2, 37
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 35
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 249
LDI r11, 22
LDI r12, 212
LDI r13, 49
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
