; DESCRIPTION: Composite: Renders a green disk with center (114, 66) and radius 10 then Sets a single orange pixel at (497, 19) then Places a orange line segment connecting (483, 28) to (135, 101).
; PLAN: r0=114(x), r1=66(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=497(x), r6=19(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=483(x1), r11=28(y1), r12=135(x2), r13=101(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 114
LDI r1, 66
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 497
LDI r6, 19
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 483
LDI r11, 28
LDI r12, 135
LDI r13, 101
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
