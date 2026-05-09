; DESCRIPTION: Composite: Draws a blue line from (95, 76) to (85, 62) then Places a purple dot at position (450, 26) then Draws a purple circle centered at (256, 141) with radius 34.
; PLAN: r0=95(x1), r1=76(y1), r2=85(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=450(x), r6=26(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=256(x), r11=141(y), r12=34(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 95
LDI r1, 76
LDI r2, 85
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 26
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 256
LDI r11, 141
LDI r12, 34
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
