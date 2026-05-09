; DESCRIPTION: Composite: Places a black line segment connecting (407, 163) to (230, 196) then Places a red dot at position (230, 25) then Places a green circle of radius 18 at center (462, 235).
; PLAN: r0=407(x1), r1=163(y1), r2=230(x2), r3=196(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=230(x), r6=25(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=462(x), r11=235(y), r12=18(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 407
LDI r1, 163
LDI r2, 230
LDI r3, 196
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 25
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 462
LDI r11, 235
LDI r12, 18
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
