; DESCRIPTION: Composite: Renders a red line between points (440, 167) and (208, 4) then Draws a yellow circle centered at (144, 102) with radius 61 then Sets a single black pixel at (97, 107).
; PLAN: r0=440(x1), r1=167(y1), r2=208(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=144(x), r6=102(y), r7=61(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=97(x), r11=107(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 440
LDI r1, 167
LDI r2, 208
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 102
LDI r7, 61
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 97
LDI r11, 107
LDI r12, 0x000000
PSET r10, r11, r12
HALT
