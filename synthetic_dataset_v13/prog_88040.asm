; DESCRIPTION: Composite: Draws a green circle centered at (39, 93) with radius 10 then Places a yellow line segment connecting (56, 49) to (46, 98) then Places a black dot at position (311, 22).
; PLAN: r0=39(x), r1=93(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=56(x1), r6=49(y1), r7=46(x2), r8=98(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=311(x), r11=22(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 39
LDI r1, 93
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 56
LDI r6, 49
LDI r7, 46
LDI r8, 98
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 311
LDI r11, 22
LDI r12, 0x000000
PSET r10, r11, r12
HALT
