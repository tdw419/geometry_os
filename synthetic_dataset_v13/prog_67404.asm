; DESCRIPTION: Composite: Renders a yellow line between points (60, 162) and (412, 46) then Places a purple dot at position (316, 29) then Places a orange circle of radius 51 at center (281, 112).
; PLAN: r0=60(x1), r1=162(y1), r2=412(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=29(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=281(x), r11=112(y), r12=51(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 60
LDI r1, 162
LDI r2, 412
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 29
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 281
LDI r11, 112
LDI r12, 51
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
