; DESCRIPTION: Composite: Renders a red line between points (79, 214) and (125, 6) then Places a yellow dot at position (250, 151) then Renders a orange disk with center (449, 170) and radius 59.
; PLAN: r0=79(x1), r1=214(y1), r2=125(x2), r3=6(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=250(x), r6=151(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=449(x), r11=170(y), r12=59(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 79
LDI r1, 214
LDI r2, 125
LDI r3, 6
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 151
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 449
LDI r11, 170
LDI r12, 59
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
