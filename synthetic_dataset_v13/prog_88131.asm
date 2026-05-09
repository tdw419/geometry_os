; DESCRIPTION: Composite: Places a red line segment connecting (147, 140) to (238, 238) then Places a purple dot at position (492, 121) then Creates a magenta circular shape at (290, 126) with radius 13.
; PLAN: r0=147(x1), r1=140(y1), r2=238(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=492(x), r6=121(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=290(x), r11=126(y), r12=13(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 147
LDI r1, 140
LDI r2, 238
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 492
LDI r6, 121
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 290
LDI r11, 126
LDI r12, 13
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
