; DESCRIPTION: Composite: Places a yellow circle of radius 41 at center (171, 43) then Sets a single blue pixel at (100, 245) then Draws a green line from (65, 239) to (486, 62).
; PLAN: r0=171(x), r1=43(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=100(x), r6=245(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=65(x1), r11=239(y1), r12=486(x2), r13=62(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 171
LDI r1, 43
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 100
LDI r6, 245
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 65
LDI r11, 239
LDI r12, 486
LDI r13, 62
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
