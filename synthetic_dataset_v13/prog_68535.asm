; DESCRIPTION: Composite: Renders a magenta line between points (282, 59) and (105, 9) then Sets a single green pixel at (173, 75) then Places a black circle of radius 45 at center (98, 86).
; PLAN: r0=282(x1), r1=59(y1), r2=105(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=173(x), r6=75(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=98(x), r11=86(y), r12=45(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 282
LDI r1, 59
LDI r2, 105
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 75
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 98
LDI r11, 86
LDI r12, 45
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
