; DESCRIPTION: Composite: Renders a white line between points (144, 84) and (281, 238) then Sets a single cyan pixel at (484, 24) then Places a yellow circle of radius 12 at center (460, 145).
; PLAN: r0=144(x1), r1=84(y1), r2=281(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=484(x), r6=24(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=460(x), r11=145(y), r12=12(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 144
LDI r1, 84
LDI r2, 281
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 484
LDI r6, 24
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 460
LDI r11, 145
LDI r12, 12
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
