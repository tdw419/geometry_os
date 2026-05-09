; DESCRIPTION: Composite: Places a yellow 51x103 rectangle at position (337, 25) then Places a purple circle of radius 63 at center (347, 174) then Places a purple dot at position (25, 185).
; PLAN: r0=337(x), r1=25(y), r2=51(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x), r6=174(y), r7=63(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=25(x), r11=185(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 337
LDI r1, 25
LDI r2, 51
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 174
LDI r7, 63
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 25
LDI r11, 185
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
