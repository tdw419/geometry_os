; DESCRIPTION: Composite: Places a yellow dot at position (233, 18) then Renders a blue line between points (319, 212) and (272, 1) then Creates a green circular shape at (295, 183) with radius 60.
; PLAN: r0=233(x), r1=18(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=319(x1), r6=212(y1), r7=272(x2), r8=1(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=295(x), r11=183(y), r12=60(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 233
LDI r1, 18
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 319
LDI r6, 212
LDI r7, 272
LDI r8, 1
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 295
LDI r11, 183
LDI r12, 60
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
