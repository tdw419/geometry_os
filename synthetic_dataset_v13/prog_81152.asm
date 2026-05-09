; DESCRIPTION: Composite: Sets a single cyan pixel at (170, 85) then Renders a yellow line between points (441, 45) and (84, 236) then Draws a yellow circle centered at (380, 145) with radius 48.
; PLAN: r0=170(x), r1=85(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=441(x1), r6=45(y1), r7=84(x2), r8=236(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=380(x), r11=145(y), r12=48(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 170
LDI r1, 85
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 441
LDI r6, 45
LDI r7, 84
LDI r8, 236
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 380
LDI r11, 145
LDI r12, 48
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
