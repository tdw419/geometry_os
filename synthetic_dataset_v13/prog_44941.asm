; DESCRIPTION: Composite: Renders a black line between points (159, 81) and (459, 251) then Creates a magenta circular shape at (349, 197) with radius 47 then Places a blue dot at position (446, 220).
; PLAN: r0=159(x1), r1=81(y1), r2=459(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=349(x), r6=197(y), r7=47(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=446(x), r11=220(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 159
LDI r1, 81
LDI r2, 459
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 197
LDI r7, 47
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 446
LDI r11, 220
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
