; DESCRIPTION: Composite: Places a green circle of radius 48 at center (108, 88) then Draws a red line from (318, 129) to (496, 3) then Sets a single purple pixel at (196, 11).
; PLAN: r0=108(x), r1=88(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=318(x1), r6=129(y1), r7=496(x2), r8=3(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=196(x), r11=11(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 108
LDI r1, 88
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 318
LDI r6, 129
LDI r7, 496
LDI r8, 3
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 196
LDI r11, 11
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
