; DESCRIPTION: Composite: Draws a purple line from (449, 32) to (170, 18) then Places a green dot at position (280, 66) then Renders a orange disk with center (192, 152) and radius 79.
; PLAN: r0=449(x1), r1=32(y1), r2=170(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=280(x), r6=66(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=192(x), r11=152(y), r12=79(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 449
LDI r1, 32
LDI r2, 170
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 66
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 192
LDI r11, 152
LDI r12, 79
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
