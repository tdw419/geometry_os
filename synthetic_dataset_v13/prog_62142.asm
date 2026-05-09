; DESCRIPTION: Composite: Places a magenta circle of radius 52 at center (122, 114) then Sets a single orange pixel at (175, 138) then Places a red line segment connecting (43, 118) to (425, 244).
; PLAN: r0=122(x), r1=114(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=175(x), r6=138(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=43(x1), r11=118(y1), r12=425(x2), r13=244(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 122
LDI r1, 114
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 175
LDI r6, 138
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 43
LDI r11, 118
LDI r12, 425
LDI r13, 244
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
