; DESCRIPTION: Composite: Draws a white circle centered at (323, 179) with radius 51 then Sets a single magenta pixel at (318, 26) then Places a yellow 39x57 rectangle at position (255, 35).
; PLAN: r0=323(x), r1=179(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=318(x), r6=26(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=255(x), r11=35(y), r12=39(width), r13=57(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 323
LDI r1, 179
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 318
LDI r6, 26
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 255
LDI r11, 35
LDI r12, 39
LDI r13, 57
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
