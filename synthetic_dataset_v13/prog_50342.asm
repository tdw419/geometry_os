; DESCRIPTION: Composite: Places a green circle of radius 78 at center (122, 147) then Sets a single orange pixel at (80, 102) then Draws a white line from (219, 239) to (452, 196).
; PLAN: r0=122(x), r1=147(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=80(x), r6=102(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=219(x1), r11=239(y1), r12=452(x2), r13=196(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 122
LDI r1, 147
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 80
LDI r6, 102
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 219
LDI r11, 239
LDI r12, 452
LDI r13, 196
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
