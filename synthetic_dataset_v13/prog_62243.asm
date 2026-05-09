; DESCRIPTION: Composite: Draws a orange line from (448, 138) to (59, 72) then Renders a yellow disk with center (322, 123) and radius 49 then Places a white dot at position (459, 37).
; PLAN: r0=448(x1), r1=138(y1), r2=59(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=322(x), r6=123(y), r7=49(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=459(x), r11=37(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 448
LDI r1, 138
LDI r2, 59
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 123
LDI r7, 49
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 459
LDI r11, 37
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
