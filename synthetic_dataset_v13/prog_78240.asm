; DESCRIPTION: Composite: Draws a black line from (247, 233) to (131, 37) then Places a yellow dot at position (364, 173) then Draws a green circle centered at (359, 77) with radius 71.
; PLAN: r0=247(x1), r1=233(y1), r2=131(x2), r3=37(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=364(x), r6=173(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=359(x), r11=77(y), r12=71(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 247
LDI r1, 233
LDI r2, 131
LDI r3, 37
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 173
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 359
LDI r11, 77
LDI r12, 71
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
