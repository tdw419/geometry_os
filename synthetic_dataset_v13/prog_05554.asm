; DESCRIPTION: Composite: Draws a yellow circle centered at (145, 143) with radius 54 then Places a black line segment connecting (427, 44) to (242, 5) then Places a yellow dot at position (89, 242).
; PLAN: r0=145(x), r1=143(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=427(x1), r6=44(y1), r7=242(x2), r8=5(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=89(x), r11=242(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 145
LDI r1, 143
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 427
LDI r6, 44
LDI r7, 242
LDI r8, 5
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 89
LDI r11, 242
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
