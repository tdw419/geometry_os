; DESCRIPTION: Composite: Sets a single white pixel at (235, 176) then Draws a purple line from (189, 199) to (233, 105) then Draws a magenta circle centered at (74, 160) with radius 72.
; PLAN: r0=235(x), r1=176(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=189(x1), r6=199(y1), r7=233(x2), r8=105(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=74(x), r11=160(y), r12=72(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 235
LDI r1, 176
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 189
LDI r6, 199
LDI r7, 233
LDI r8, 105
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 74
LDI r11, 160
LDI r12, 72
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
