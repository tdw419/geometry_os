; DESCRIPTION: Composite: Renders a red line between points (481, 186) and (318, 226) then Places a blue dot at position (465, 83) then Renders a black disk with center (98, 61) and radius 48.
; PLAN: r0=481(x1), r1=186(y1), r2=318(x2), r3=226(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=465(x), r6=83(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=98(x), r11=61(y), r12=48(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 481
LDI r1, 186
LDI r2, 318
LDI r3, 226
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 83
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 98
LDI r11, 61
LDI r12, 48
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
