; DESCRIPTION: Composite: Places a purple line segment connecting (110, 14) to (346, 235) then Creates a blue circular shape at (24, 215) with radius 19 then Places a orange dot at position (483, 136).
; PLAN: r0=110(x1), r1=14(y1), r2=346(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=24(x), r6=215(y), r7=19(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=483(x), r11=136(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 110
LDI r1, 14
LDI r2, 346
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 215
LDI r7, 19
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 483
LDI r11, 136
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
