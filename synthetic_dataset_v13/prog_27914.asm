; DESCRIPTION: Composite: Places a black line segment connecting (351, 170) to (268, 8) then Draws a yellow circle centered at (175, 112) with radius 63 then Sets a single green pixel at (73, 240).
; PLAN: r0=351(x1), r1=170(y1), r2=268(x2), r3=8(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=112(y), r7=63(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=73(x), r11=240(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 351
LDI r1, 170
LDI r2, 268
LDI r3, 8
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 112
LDI r7, 63
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 73
LDI r11, 240
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
