; DESCRIPTION: Composite: Places a white circle of radius 29 at center (478, 178) then Sets a single white pixel at (248, 13) then Renders a white line between points (465, 9) and (321, 173).
; PLAN: r0=478(x), r1=178(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=248(x), r6=13(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=465(x1), r11=9(y1), r12=321(x2), r13=173(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 478
LDI r1, 178
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 248
LDI r6, 13
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 465
LDI r11, 9
LDI r12, 321
LDI r13, 173
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
