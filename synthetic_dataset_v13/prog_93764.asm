; DESCRIPTION: Composite: Sets a single white pixel at (161, 235) then Draws a purple circle centered at (174, 165) with radius 66 then Renders a white line between points (202, 147) and (344, 122).
; PLAN: r0=161(x), r1=235(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=174(x), r6=165(y), r7=66(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=202(x1), r11=147(y1), r12=344(x2), r13=122(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 161
LDI r1, 235
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 174
LDI r6, 165
LDI r7, 66
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 202
LDI r11, 147
LDI r12, 344
LDI r13, 122
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
