; DESCRIPTION: Composite: Draws a blue circle centered at (292, 57) with radius 34 then Creates a blue rectangular region at (432, 142) spanning 51 by 69 pixels then Sets a single white pixel at (226, 51).
; PLAN: r0=292(x), r1=57(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=432(x), r6=142(y), r7=51(width), r8=69(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=226(x), r11=51(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 292
LDI r1, 57
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 432
LDI r6, 142
LDI r7, 51
LDI r8, 69
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 226
LDI r11, 51
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
