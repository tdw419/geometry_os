; DESCRIPTION: Composite: Renders a green disk with center (142, 180) and radius 40 then Places a white dot at position (381, 232) then Renders a magenta line between points (347, 83) and (315, 195).
; PLAN: r0=142(x), r1=180(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=381(x), r6=232(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=347(x1), r11=83(y1), r12=315(x2), r13=195(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 142
LDI r1, 180
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 381
LDI r6, 232
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 347
LDI r11, 83
LDI r12, 315
LDI r13, 195
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
