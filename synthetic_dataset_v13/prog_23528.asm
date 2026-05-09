; DESCRIPTION: Composite: Draws a green line from (75, 43) to (185, 72) then Draws a cyan circle centered at (311, 113) with radius 52 then Sets a single blue pixel at (100, 47).
; PLAN: r0=75(x1), r1=43(y1), r2=185(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=311(x), r6=113(y), r7=52(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=100(x), r11=47(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 75
LDI r1, 43
LDI r2, 185
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 113
LDI r7, 52
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 100
LDI r11, 47
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
