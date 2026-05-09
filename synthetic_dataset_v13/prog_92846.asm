; DESCRIPTION: Composite: Renders a cyan line between points (104, 159) and (336, 131) then Sets a single white pixel at (320, 197) then Draws a black circle centered at (238, 174) with radius 37.
; PLAN: r0=104(x1), r1=159(y1), r2=336(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=197(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=238(x), r11=174(y), r12=37(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 104
LDI r1, 159
LDI r2, 336
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 197
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 238
LDI r11, 174
LDI r12, 37
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
