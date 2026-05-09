; DESCRIPTION: Composite: Renders a red disk with center (459, 105) and radius 35 then Sets a single red pixel at (311, 252) then Creates a magenta rectangular region at (217, 142) spanning 112 by 74 pixels.
; PLAN: r0=459(x), r1=105(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=311(x), r6=252(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=217(x), r11=142(y), r12=112(width), r13=74(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 459
LDI r1, 105
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 311
LDI r6, 252
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 217
LDI r11, 142
LDI r12, 112
LDI r13, 74
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
