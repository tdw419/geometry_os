; DESCRIPTION: Composite: Places a black line segment connecting (176, 18) to (319, 6) then Draws a blue circle centered at (115, 170) with radius 54 then Places a yellow dot at position (2, 128).
; PLAN: r0=176(x1), r1=18(y1), r2=319(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=170(y), r7=54(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=2(x), r11=128(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 176
LDI r1, 18
LDI r2, 319
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 170
LDI r7, 54
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 2
LDI r11, 128
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
