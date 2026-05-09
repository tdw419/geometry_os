; DESCRIPTION: Composite: Draws a yellow line from (272, 64) to (173, 216) then Draws a blue circle centered at (434, 173) with radius 40 then Places a black dot at position (139, 130).
; PLAN: r0=272(x1), r1=64(y1), r2=173(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=434(x), r6=173(y), r7=40(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=139(x), r11=130(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 272
LDI r1, 64
LDI r2, 173
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 173
LDI r7, 40
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 139
LDI r11, 130
LDI r12, 0x000000
PSET r10, r11, r12
HALT
