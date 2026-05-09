; DESCRIPTION: Composite: Renders a magenta line between points (320, 197) and (434, 125) then Places a black dot at position (63, 110) then Renders a blue disk with center (46, 132) and radius 37.
; PLAN: r0=320(x1), r1=197(y1), r2=434(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=63(x), r6=110(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=46(x), r11=132(y), r12=37(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 320
LDI r1, 197
LDI r2, 434
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 110
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 46
LDI r11, 132
LDI r12, 37
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
