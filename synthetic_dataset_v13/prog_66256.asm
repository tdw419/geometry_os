; DESCRIPTION: Composite: Renders a red disk with center (255, 98) and radius 44 then Sets a single black pixel at (95, 199) then Draws a red line from (256, 80) to (282, 118).
; PLAN: r0=255(x), r1=98(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=95(x), r6=199(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=256(x1), r11=80(y1), r12=282(x2), r13=118(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 255
LDI r1, 98
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 95
LDI r6, 199
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 256
LDI r11, 80
LDI r12, 282
LDI r13, 118
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
