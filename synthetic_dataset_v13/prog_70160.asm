; DESCRIPTION: Composite: Draws a yellow line from (183, 185) to (114, 150) then Places a green dot at position (125, 230) then Places a yellow circle of radius 71 at center (195, 185).
; PLAN: r0=183(x1), r1=185(y1), r2=114(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=125(x), r6=230(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=195(x), r11=185(y), r12=71(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 183
LDI r1, 185
LDI r2, 114
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 230
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 195
LDI r11, 185
LDI r12, 71
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
