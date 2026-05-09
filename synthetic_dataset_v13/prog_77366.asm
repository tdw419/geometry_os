; DESCRIPTION: Composite: Places a white dot at position (4, 251) then Places a black circle of radius 15 at center (352, 57) then Places a yellow line segment connecting (427, 18) to (148, 152).
; PLAN: r0=4(x), r1=251(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=352(x), r6=57(y), r7=15(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=427(x1), r11=18(y1), r12=148(x2), r13=152(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 4
LDI r1, 251
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 352
LDI r6, 57
LDI r7, 15
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 427
LDI r11, 18
LDI r12, 148
LDI r13, 152
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
