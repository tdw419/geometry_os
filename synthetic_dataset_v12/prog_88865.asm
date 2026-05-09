; DESCRIPTION: Composite: Places a magenta circle of radius 76 at center (370, 114) then Sets a single blue pixel at (77, 213) then Places a red line segment connecting (239, 189) to (448, 233).
; PLAN: r0=370(x), r1=114(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=77(x), r6=213(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=239(x1), r11=189(y1), r12=448(x2), r13=233(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 370
LDI r1, 114
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 77
LDI r6, 213
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 239
LDI r11, 189
LDI r12, 448
LDI r13, 233
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
