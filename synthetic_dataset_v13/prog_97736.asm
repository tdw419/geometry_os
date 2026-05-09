; DESCRIPTION: Composite: Renders a yellow line between points (316, 239) and (235, 73) then Draws a green circle centered at (77, 101) with radius 44 then Sets a single black pixel at (334, 159).
; PLAN: r0=316(x1), r1=239(y1), r2=235(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=77(x), r6=101(y), r7=44(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=334(x), r11=159(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 316
LDI r1, 239
LDI r2, 235
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 101
LDI r7, 44
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 334
LDI r11, 159
LDI r12, 0x000000
PSET r10, r11, r12
HALT
