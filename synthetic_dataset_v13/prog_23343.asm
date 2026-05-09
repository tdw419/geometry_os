; DESCRIPTION: Composite: Draws a blue circle centered at (275, 116) with radius 68 then Sets a single cyan pixel at (343, 227) then Draws a black line from (452, 36) to (232, 53).
; PLAN: r0=275(x), r1=116(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=343(x), r6=227(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=452(x1), r11=36(y1), r12=232(x2), r13=53(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 275
LDI r1, 116
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 343
LDI r6, 227
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 452
LDI r11, 36
LDI r12, 232
LDI r13, 53
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
