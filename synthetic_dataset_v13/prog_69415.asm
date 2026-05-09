; DESCRIPTION: Composite: Places a black dot at position (192, 13) then Places a white circle of radius 23 at center (310, 136) then Places a red line segment connecting (504, 89) to (2, 85).
; PLAN: r0=192(x), r1=13(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=310(x), r6=136(y), r7=23(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=504(x1), r11=89(y1), r12=2(x2), r13=85(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 192
LDI r1, 13
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 310
LDI r6, 136
LDI r7, 23
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 504
LDI r11, 89
LDI r12, 2
LDI r13, 85
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
