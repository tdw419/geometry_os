; DESCRIPTION: Composite: Places a purple circle of radius 19 at center (336, 93) then Sets a single white pixel at (373, 148) then Places a black line segment connecting (480, 61) to (468, 166).
; PLAN: r0=336(x), r1=93(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=373(x), r6=148(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=480(x1), r11=61(y1), r12=468(x2), r13=166(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 336
LDI r1, 93
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 373
LDI r6, 148
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 480
LDI r11, 61
LDI r12, 468
LDI r13, 166
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
