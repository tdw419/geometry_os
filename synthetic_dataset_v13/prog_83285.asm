; DESCRIPTION: Composite: Places a green dot at position (389, 104) then Places a blue line segment connecting (227, 185) to (343, 138) then Places a blue 112x60 rectangle at position (397, 147).
; PLAN: r0=389(x), r1=104(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=227(x1), r6=185(y1), r7=343(x2), r8=138(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=397(x), r11=147(y), r12=112(width), r13=60(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 389
LDI r1, 104
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 227
LDI r6, 185
LDI r7, 343
LDI r8, 138
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 397
LDI r11, 147
LDI r12, 112
LDI r13, 60
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
