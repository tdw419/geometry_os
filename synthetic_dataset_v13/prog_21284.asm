; DESCRIPTION: Composite: Sets a single black pixel at (488, 58) then Places a yellow line segment connecting (400, 209) to (130, 235) then Creates a cyan circular shape at (285, 187) with radius 61.
; PLAN: r0=488(x), r1=58(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=400(x1), r6=209(y1), r7=130(x2), r8=235(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=285(x), r11=187(y), r12=61(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 488
LDI r1, 58
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 400
LDI r6, 209
LDI r7, 130
LDI r8, 235
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 285
LDI r11, 187
LDI r12, 61
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
