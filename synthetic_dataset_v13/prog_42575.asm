; DESCRIPTION: Composite: Renders a white disk with center (316, 56) and radius 41 then Places a yellow dot at position (68, 254) then Draws a white line from (248, 123) to (434, 222).
; PLAN: r0=316(x), r1=56(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x), r6=254(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=248(x1), r11=123(y1), r12=434(x2), r13=222(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 316
LDI r1, 56
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 254
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 248
LDI r11, 123
LDI r12, 434
LDI r13, 222
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
