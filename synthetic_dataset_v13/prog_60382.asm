; DESCRIPTION: Composite: Sets a single cyan pixel at (275, 63) then Renders a orange line between points (279, 76) and (355, 93) then Draws a cyan circle centered at (101, 136) with radius 63.
; PLAN: r0=275(x), r1=63(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=279(x1), r6=76(y1), r7=355(x2), r8=93(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=101(x), r11=136(y), r12=63(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 275
LDI r1, 63
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 279
LDI r6, 76
LDI r7, 355
LDI r8, 93
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 101
LDI r11, 136
LDI r12, 63
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
