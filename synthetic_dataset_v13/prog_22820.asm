; DESCRIPTION: Composite: Renders a orange line between points (18, 14) and (107, 229) then Renders a blue disk with center (90, 156) and radius 66 then Places a black dot at position (222, 239).
; PLAN: r0=18(x1), r1=14(y1), r2=107(x2), r3=229(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=90(x), r6=156(y), r7=66(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=222(x), r11=239(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 18
LDI r1, 14
LDI r2, 107
LDI r3, 229
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 156
LDI r7, 66
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 222
LDI r11, 239
LDI r12, 0x000000
PSET r10, r11, r12
HALT
