; DESCRIPTION: Composite: Renders a white line between points (289, 69) and (235, 43) then Sets a single white pixel at (136, 112) then Creates a blue rectangular region at (426, 163) spanning 83 by 37 pixels.
; PLAN: r0=289(x1), r1=69(y1), r2=235(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=136(x), r6=112(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=426(x), r11=163(y), r12=83(width), r13=37(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 289
LDI r1, 69
LDI r2, 235
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 112
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 426
LDI r11, 163
LDI r12, 83
LDI r13, 37
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
