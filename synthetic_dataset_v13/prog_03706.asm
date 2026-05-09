; DESCRIPTION: Composite: Draws a blue circle centered at (375, 112) with radius 39 then Draws a orange line from (434, 72) to (195, 251).
; PLAN: r0=375(x), r1=112(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=434(x1), r6=72(y1), r7=195(x2), r8=251(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 375
LDI r1, 112
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 434
LDI r6, 72
LDI r7, 195
LDI r8, 251
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
