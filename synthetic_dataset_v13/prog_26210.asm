; DESCRIPTION: Composite: Creates a blue circular shape at (239, 55) with radius 29 then Sets a single red pixel at (230, 89) then Draws a blue line from (29, 133) to (249, 144).
; PLAN: r0=239(x), r1=55(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=230(x), r6=89(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=29(x1), r11=133(y1), r12=249(x2), r13=144(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 239
LDI r1, 55
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 230
LDI r6, 89
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 29
LDI r11, 133
LDI r12, 249
LDI r13, 144
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
