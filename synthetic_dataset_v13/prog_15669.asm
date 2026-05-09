; DESCRIPTION: Composite: Draws a red circle centered at (367, 130) with radius 64 then Sets a single black pixel at (189, 104) then Places a red line segment connecting (504, 118) to (181, 174).
; PLAN: r0=367(x), r1=130(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=189(x), r6=104(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=504(x1), r11=118(y1), r12=181(x2), r13=174(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 367
LDI r1, 130
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 189
LDI r6, 104
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 504
LDI r11, 118
LDI r12, 181
LDI r13, 174
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
