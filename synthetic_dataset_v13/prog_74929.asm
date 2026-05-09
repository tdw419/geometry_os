; DESCRIPTION: Composite: Places a purple dot at position (160, 31) then Renders a yellow line between points (367, 148) and (147, 213) then Draws a blue circle centered at (259, 82) with radius 60.
; PLAN: r0=160(x), r1=31(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=367(x1), r6=148(y1), r7=147(x2), r8=213(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=259(x), r11=82(y), r12=60(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 160
LDI r1, 31
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 367
LDI r6, 148
LDI r7, 147
LDI r8, 213
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 259
LDI r11, 82
LDI r12, 60
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
