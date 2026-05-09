; DESCRIPTION: Composite: Renders a magenta line between points (426, 41) and (262, 105) then Places a blue dot at position (102, 183) then Places a red circle of radius 56 at center (129, 69).
; PLAN: r0=426(x1), r1=41(y1), r2=262(x2), r3=105(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=183(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=129(x), r11=69(y), r12=56(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 426
LDI r1, 41
LDI r2, 262
LDI r3, 105
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 183
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 129
LDI r11, 69
LDI r12, 56
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
