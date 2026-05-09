; DESCRIPTION: Composite: Places a yellow line segment connecting (435, 31) to (64, 18) then Sets a single green pixel at (75, 5) then Renders a green disk with center (247, 203) and radius 51.
; PLAN: r0=435(x1), r1=31(y1), r2=64(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=75(x), r6=5(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=247(x), r11=203(y), r12=51(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 435
LDI r1, 31
LDI r2, 64
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 5
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 247
LDI r11, 203
LDI r12, 51
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
