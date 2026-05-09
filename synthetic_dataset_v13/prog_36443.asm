; DESCRIPTION: Composite: Places a blue dot at position (277, 110) then Places a red 17x51 rectangle at position (112, 89) then Creates a purple circular shape at (207, 124) with radius 40.
; PLAN: r0=277(x), r1=110(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=112(x), r6=89(y), r7=17(width), r8=51(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=207(x), r11=124(y), r12=40(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 277
LDI r1, 110
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 112
LDI r6, 89
LDI r7, 17
LDI r8, 51
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 207
LDI r11, 124
LDI r12, 40
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
