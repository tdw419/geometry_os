; DESCRIPTION: Composite: Places a white dot at position (453, 161) then Places a blue 79x79 rectangle at position (312, 160) then Draws a black circle centered at (185, 119) with radius 69.
; PLAN: r0=453(x), r1=161(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=312(x), r6=160(y), r7=79(width), r8=79(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=185(x), r11=119(y), r12=69(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 453
LDI r1, 161
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 312
LDI r6, 160
LDI r7, 79
LDI r8, 79
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 185
LDI r11, 119
LDI r12, 69
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
