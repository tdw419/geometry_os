; DESCRIPTION: Composite: Creates a red circular shape at (270, 147) with radius 71 then Places a black dot at position (78, 128) then Draws a black line from (145, 72) to (244, 70).
; PLAN: r0=270(x), r1=147(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=78(x), r6=128(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=145(x1), r11=72(y1), r12=244(x2), r13=70(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 147
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 78
LDI r6, 128
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 145
LDI r11, 72
LDI r12, 244
LDI r13, 70
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
