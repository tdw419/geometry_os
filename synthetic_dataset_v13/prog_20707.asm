; DESCRIPTION: Composite: Places a yellow circle of radius 32 at center (59, 172) then Renders a purple line between points (155, 51) and (446, 183) then Sets a single white pixel at (125, 19).
; PLAN: r0=59(x), r1=172(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=155(x1), r6=51(y1), r7=446(x2), r8=183(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=125(x), r11=19(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 59
LDI r1, 172
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 155
LDI r6, 51
LDI r7, 446
LDI r8, 183
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 125
LDI r11, 19
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
