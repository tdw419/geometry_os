; DESCRIPTION: Composite: Creates a black rectangular region at (426, 228) spanning 18 by 12 pixels then Renders a purple line between points (62, 198) and (467, 98) then Sets a single black pixel at (37, 119).
; PLAN: r0=426(x), r1=228(y), r2=18(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=62(x1), r6=198(y1), r7=467(x2), r8=98(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=37(x), r11=119(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 426
LDI r1, 228
LDI r2, 18
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 198
LDI r7, 467
LDI r8, 98
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 37
LDI r11, 119
LDI r12, 0x000000
PSET r10, r11, r12
HALT
