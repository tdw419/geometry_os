; DESCRIPTION: Composite: Draws a black line from (412, 158) to (214, 248) then Places a black circle of radius 76 at center (318, 140).
; PLAN: r0=412(x1), r1=158(y1), r2=214(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=140(y), r7=76(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 412
LDI r1, 158
LDI r2, 214
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 140
LDI r7, 76
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
