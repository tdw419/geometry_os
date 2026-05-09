; DESCRIPTION: Composite: Renders a blue line between points (480, 48) and (136, 183) then Creates a cyan rectangular region at (369, 51) spanning 19 by 107 pixels then Sets a single cyan pixel at (115, 251).
; PLAN: r0=480(x1), r1=48(y1), r2=136(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=51(y), r7=19(width), r8=107(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=115(x), r11=251(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 480
LDI r1, 48
LDI r2, 136
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 51
LDI r7, 19
LDI r8, 107
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 115
LDI r11, 251
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
