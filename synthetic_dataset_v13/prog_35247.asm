; DESCRIPTION: Composite: Places a black dot at position (488, 112) then Creates a yellow circular shape at (94, 103) with radius 45 then Draws a white line from (235, 201) to (27, 115).
; PLAN: r0=488(x), r1=112(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=94(x), r6=103(y), r7=45(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=235(x1), r11=201(y1), r12=27(x2), r13=115(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 488
LDI r1, 112
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 94
LDI r6, 103
LDI r7, 45
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 235
LDI r11, 201
LDI r12, 27
LDI r13, 115
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
