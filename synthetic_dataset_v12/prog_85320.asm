; DESCRIPTION: Composite: Places a black circle of radius 65 at center (141, 162) then Sets a single orange pixel at (102, 23) then Renders a black line between points (490, 92) and (150, 174).
; PLAN: r0=141(x), r1=162(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=102(x), r6=23(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=490(x1), r11=92(y1), r12=150(x2), r13=174(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 141
LDI r1, 162
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 102
LDI r6, 23
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 490
LDI r11, 92
LDI r12, 150
LDI r13, 174
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
