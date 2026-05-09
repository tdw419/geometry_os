; DESCRIPTION: Composite: Draws a white line from (199, 237) to (147, 225) then Sets a single magenta pixel at (429, 47) then Draws a magenta rectangle at (81, 22) with width 119 and height 52.
; PLAN: r0=199(x1), r1=237(y1), r2=147(x2), r3=225(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=429(x), r6=47(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=81(x), r11=22(y), r12=119(width), r13=52(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 199
LDI r1, 237
LDI r2, 147
LDI r3, 225
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 47
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 81
LDI r11, 22
LDI r12, 119
LDI r13, 52
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
