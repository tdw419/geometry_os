; DESCRIPTION: Composite: Places a purple line segment connecting (272, 220) to (82, 82) then Places a green dot at position (241, 176) then Renders a orange disk with center (372, 84) and radius 71.
; PLAN: r0=272(x1), r1=220(y1), r2=82(x2), r3=82(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=176(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=372(x), r11=84(y), r12=71(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 272
LDI r1, 220
LDI r2, 82
LDI r3, 82
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 176
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 372
LDI r11, 84
LDI r12, 71
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
