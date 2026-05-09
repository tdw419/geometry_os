; DESCRIPTION: Composite: Draws a red line from (356, 90) to (486, 160) then Sets a single black pixel at (141, 118) then Renders a cyan disk with center (315, 42) and radius 30.
; PLAN: r0=356(x1), r1=90(y1), r2=486(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=141(x), r6=118(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=315(x), r11=42(y), r12=30(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 356
LDI r1, 90
LDI r2, 486
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 118
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 315
LDI r11, 42
LDI r12, 30
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
