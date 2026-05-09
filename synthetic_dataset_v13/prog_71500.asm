; DESCRIPTION: Composite: Places a orange line segment connecting (499, 36) to (238, 3) then Draws a green circle centered at (465, 87) with radius 47 then Sets a single white pixel at (408, 105).
; PLAN: r0=499(x1), r1=36(y1), r2=238(x2), r3=3(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=465(x), r6=87(y), r7=47(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=408(x), r11=105(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 499
LDI r1, 36
LDI r2, 238
LDI r3, 3
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 87
LDI r7, 47
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 408
LDI r11, 105
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
