; DESCRIPTION: Composite: Places a magenta dot at position (31, 162) then Draws a purple circle centered at (87, 140) with radius 72 then Places a blue line segment connecting (162, 126) to (89, 186).
; PLAN: r0=31(x), r1=162(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=87(x), r6=140(y), r7=72(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=162(x1), r11=126(y1), r12=89(x2), r13=186(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 31
LDI r1, 162
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 87
LDI r6, 140
LDI r7, 72
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 162
LDI r11, 126
LDI r12, 89
LDI r13, 186
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
