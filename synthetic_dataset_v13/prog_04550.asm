; DESCRIPTION: Composite: Renders a green disk with center (103, 178) and radius 69 then Places a orange dot at position (408, 191) then Places a green line segment connecting (350, 179) to (490, 119).
; PLAN: r0=103(x), r1=178(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=408(x), r6=191(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=350(x1), r11=179(y1), r12=490(x2), r13=119(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 103
LDI r1, 178
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 408
LDI r6, 191
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 350
LDI r11, 179
LDI r12, 490
LDI r13, 119
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
