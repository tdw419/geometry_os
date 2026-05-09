; DESCRIPTION: Composite: Places a blue circle of radius 26 at center (87, 136) then Places a cyan dot at position (204, 103) then Places a orange line segment connecting (86, 101) to (195, 108).
; PLAN: r0=87(x), r1=136(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=204(x), r6=103(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=86(x1), r11=101(y1), r12=195(x2), r13=108(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 136
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 204
LDI r6, 103
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 86
LDI r11, 101
LDI r12, 195
LDI r13, 108
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
