; DESCRIPTION: Composite: Draws a black line from (82, 151) to (346, 0) then Sets a single orange pixel at (286, 84) then Draws a orange circle centered at (423, 72) with radius 36.
; PLAN: r0=82(x1), r1=151(y1), r2=346(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=286(x), r6=84(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=423(x), r11=72(y), r12=36(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 82
LDI r1, 151
LDI r2, 346
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 84
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 423
LDI r11, 72
LDI r12, 36
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
