; DESCRIPTION: Composite: Draws a orange circle centered at (380, 222) with radius 16 then Places a red line segment connecting (385, 235) to (44, 230).
; PLAN: r0=380(x), r1=222(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x1), r6=235(y1), r7=44(x2), r8=230(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 380
LDI r1, 222
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 235
LDI r7, 44
LDI r8, 230
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
