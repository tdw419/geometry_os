; DESCRIPTION: Composite: Draws a blue circle centered at (199, 203) with radius 49 then Draws a purple line from (226, 247) to (21, 235).
; PLAN: r0=199(x), r1=203(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x1), r6=247(y1), r7=21(x2), r8=235(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 199
LDI r1, 203
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 247
LDI r7, 21
LDI r8, 235
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
