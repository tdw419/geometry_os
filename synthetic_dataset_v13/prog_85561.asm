; DESCRIPTION: Composite: Renders a red disk with center (313, 100) and radius 60 then Sets a single black pixel at (264, 246) then Places a red line segment connecting (9, 91) to (173, 165).
; PLAN: r0=313(x), r1=100(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=264(x), r6=246(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=9(x1), r11=91(y1), r12=173(x2), r13=165(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 100
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 264
LDI r6, 246
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 9
LDI r11, 91
LDI r12, 173
LDI r13, 165
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
