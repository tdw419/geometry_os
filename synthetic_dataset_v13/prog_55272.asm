; DESCRIPTION: Composite: Renders a yellow box of size 28x34 starting at (294, 151) then Sets a single red pixel at (387, 119) then Renders a yellow line between points (347, 79) and (155, 125).
; PLAN: r0=294(x), r1=151(y), r2=28(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=387(x), r6=119(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=347(x1), r11=79(y1), r12=155(x2), r13=125(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 294
LDI r1, 151
LDI r2, 28
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 119
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 347
LDI r11, 79
LDI r12, 155
LDI r13, 125
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
