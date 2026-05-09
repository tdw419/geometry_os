; DESCRIPTION: Composite: Renders a green line between points (235, 108) and (183, 125) then Draws a yellow circle centered at (172, 182) with radius 66.
; PLAN: r0=235(x1), r1=108(y1), r2=183(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=172(x), r6=182(y), r7=66(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 235
LDI r1, 108
LDI r2, 183
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 182
LDI r7, 66
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
