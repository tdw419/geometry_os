; DESCRIPTION: Composite: Renders a black line between points (399, 138) and (124, 94) then Sets a single black pixel at (48, 29) then Renders a blue box of size 74x119 starting at (183, 59).
; PLAN: r0=399(x1), r1=138(y1), r2=124(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=48(x), r6=29(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=183(x), r11=59(y), r12=74(width), r13=119(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 399
LDI r1, 138
LDI r2, 124
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 48
LDI r6, 29
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 183
LDI r11, 59
LDI r12, 74
LDI r13, 119
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
