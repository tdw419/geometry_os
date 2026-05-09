; DESCRIPTION: Composite: Draws a red circle centered at (340, 91) with radius 78 then Places a purple line segment connecting (191, 4) to (235, 157).
; PLAN: r0=340(x), r1=91(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=191(x1), r6=4(y1), r7=235(x2), r8=157(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 340
LDI r1, 91
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 191
LDI r6, 4
LDI r7, 235
LDI r8, 157
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
