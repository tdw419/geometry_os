; DESCRIPTION: Composite: Places a black dot at position (36, 25) then Creates a orange circular shape at (97, 165) with radius 59 then Draws a blue line from (189, 101) to (486, 191).
; PLAN: r0=36(x), r1=25(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=97(x), r6=165(y), r7=59(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=189(x1), r11=101(y1), r12=486(x2), r13=191(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 36
LDI r1, 25
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 97
LDI r6, 165
LDI r7, 59
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 189
LDI r11, 101
LDI r12, 486
LDI r13, 191
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
