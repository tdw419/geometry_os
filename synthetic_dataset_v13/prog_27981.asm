; DESCRIPTION: Composite: Sets a single blue pixel at (454, 38) then Draws a red line from (85, 240) to (156, 62) then Draws a green circle centered at (94, 193) with radius 12.
; PLAN: r0=454(x), r1=38(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=85(x1), r6=240(y1), r7=156(x2), r8=62(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=94(x), r11=193(y), r12=12(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 454
LDI r1, 38
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 85
LDI r6, 240
LDI r7, 156
LDI r8, 62
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 94
LDI r11, 193
LDI r12, 12
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
