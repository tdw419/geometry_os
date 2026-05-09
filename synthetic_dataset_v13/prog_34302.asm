; DESCRIPTION: Composite: Places a green line segment connecting (244, 26) to (431, 18) then Draws a green circle centered at (389, 209) with radius 45 then Sets a single blue pixel at (508, 47).
; PLAN: r0=244(x1), r1=26(y1), r2=431(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=389(x), r6=209(y), r7=45(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=508(x), r11=47(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 244
LDI r1, 26
LDI r2, 431
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 209
LDI r7, 45
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 508
LDI r11, 47
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
