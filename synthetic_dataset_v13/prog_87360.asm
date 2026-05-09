; DESCRIPTION: Composite: Renders a black disk with center (272, 76) and radius 58 then Sets a single black pixel at (207, 154) then Draws a red line from (62, 120) to (53, 1).
; PLAN: r0=272(x), r1=76(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=207(x), r6=154(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=62(x1), r11=120(y1), r12=53(x2), r13=1(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 76
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 207
LDI r6, 154
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 62
LDI r11, 120
LDI r12, 53
LDI r13, 1
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
