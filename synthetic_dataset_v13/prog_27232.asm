; DESCRIPTION: Composite: Draws a purple circle centered at (157, 125) with radius 79 then Places a blue line segment connecting (442, 21) to (127, 15).
; PLAN: r0=157(x), r1=125(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=442(x1), r6=21(y1), r7=127(x2), r8=15(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 157
LDI r1, 125
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 442
LDI r6, 21
LDI r7, 127
LDI r8, 15
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
