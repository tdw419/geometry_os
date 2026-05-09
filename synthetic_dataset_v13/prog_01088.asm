; DESCRIPTION: Composite: Places a white circle of radius 21 at center (381, 120) then Sets a single orange pixel at (0, 113) then Draws a white line from (449, 64) to (356, 125).
; PLAN: r0=381(x), r1=120(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=0(x), r6=113(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=449(x1), r11=64(y1), r12=356(x2), r13=125(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 120
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 0
LDI r6, 113
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 449
LDI r11, 64
LDI r12, 356
LDI r13, 125
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
