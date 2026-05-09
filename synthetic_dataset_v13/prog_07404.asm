; DESCRIPTION: Composite: Places a blue line segment connecting (461, 201) to (211, 160) then Sets a single cyan pixel at (450, 59) then Places a black 105x104 rectangle at position (17, 85).
; PLAN: r0=461(x1), r1=201(y1), r2=211(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=450(x), r6=59(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=17(x), r11=85(y), r12=105(width), r13=104(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 461
LDI r1, 201
LDI r2, 211
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 59
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 17
LDI r11, 85
LDI r12, 105
LDI r13, 104
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
