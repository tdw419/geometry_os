; DESCRIPTION: Composite: Renders a black line between points (151, 44) and (97, 61) then Draws a magenta circle centered at (282, 64) with radius 61 then Places a white dot at position (497, 125).
; PLAN: r0=151(x1), r1=44(y1), r2=97(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=64(y), r7=61(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=497(x), r11=125(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 151
LDI r1, 44
LDI r2, 97
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 64
LDI r7, 61
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 497
LDI r11, 125
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
