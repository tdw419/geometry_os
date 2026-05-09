; DESCRIPTION: Composite: Draws a black line from (272, 112) to (195, 246) then Draws a blue circle centered at (201, 160) with radius 39 then Places a black dot at position (98, 175).
; PLAN: r0=272(x1), r1=112(y1), r2=195(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=201(x), r6=160(y), r7=39(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=98(x), r11=175(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 272
LDI r1, 112
LDI r2, 195
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 160
LDI r7, 39
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 98
LDI r11, 175
LDI r12, 0x000000
PSET r10, r11, r12
HALT
