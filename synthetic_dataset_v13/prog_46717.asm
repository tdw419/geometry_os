; DESCRIPTION: Composite: Places a black circle of radius 69 at center (325, 71) then Places a blue line segment connecting (483, 87) to (483, 72) then Places a black 113x77 rectangle at position (142, 175).
; PLAN: r0=325(x), r1=71(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=483(x1), r6=87(y1), r7=483(x2), r8=72(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=142(x), r11=175(y), r12=113(width), r13=77(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 325
LDI r1, 71
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 483
LDI r6, 87
LDI r7, 483
LDI r8, 72
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 142
LDI r11, 175
LDI r12, 113
LDI r13, 77
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
