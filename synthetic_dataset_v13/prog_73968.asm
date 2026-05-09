; DESCRIPTION: Composite: Draws a black line from (19, 128) to (366, 24) then Places a green circle of radius 73 at center (205, 116) then Sets a single red pixel at (156, 189).
; PLAN: r0=19(x1), r1=128(y1), r2=366(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=116(y), r7=73(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=156(x), r11=189(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 19
LDI r1, 128
LDI r2, 366
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 116
LDI r7, 73
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 156
LDI r11, 189
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
