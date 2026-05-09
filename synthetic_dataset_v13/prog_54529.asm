; DESCRIPTION: Composite: Sets a single red pixel at (455, 179) then Creates a green circular shape at (138, 152) with radius 40 then Places a white line segment connecting (378, 142) to (244, 207).
; PLAN: r0=455(x), r1=179(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=138(x), r6=152(y), r7=40(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=378(x1), r11=142(y1), r12=244(x2), r13=207(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 455
LDI r1, 179
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 138
LDI r6, 152
LDI r7, 40
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 378
LDI r11, 142
LDI r12, 244
LDI r13, 207
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
