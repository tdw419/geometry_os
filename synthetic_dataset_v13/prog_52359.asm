; DESCRIPTION: Composite: Renders a purple line between points (60, 5) and (105, 184) then Places a magenta dot at position (349, 69) then Draws a red circle centered at (436, 157) with radius 22.
; PLAN: r0=60(x1), r1=5(y1), r2=105(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=349(x), r6=69(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=436(x), r11=157(y), r12=22(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 60
LDI r1, 5
LDI r2, 105
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 69
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 436
LDI r11, 157
LDI r12, 22
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
