; DESCRIPTION: Composite: Sets a single blue pixel at (442, 229) then Creates a purple rectangular region at (293, 43) spanning 54 by 89 pixels then Places a blue circle of radius 12 at center (486, 54).
; PLAN: r0=442(x), r1=229(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=293(x), r6=43(y), r7=54(width), r8=89(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=486(x), r11=54(y), r12=12(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 442
LDI r1, 229
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 293
LDI r6, 43
LDI r7, 54
LDI r8, 89
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 486
LDI r11, 54
LDI r12, 12
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
