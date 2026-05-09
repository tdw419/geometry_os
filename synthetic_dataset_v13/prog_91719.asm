; DESCRIPTION: Composite: Places a black dot at position (151, 201) then Places a orange circle of radius 28 at center (328, 39) then Draws a purple line from (399, 36) to (276, 69).
; PLAN: r0=151(x), r1=201(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=328(x), r6=39(y), r7=28(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=399(x1), r11=36(y1), r12=276(x2), r13=69(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 151
LDI r1, 201
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 328
LDI r6, 39
LDI r7, 28
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 399
LDI r11, 36
LDI r12, 276
LDI r13, 69
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
