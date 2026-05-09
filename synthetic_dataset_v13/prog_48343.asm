; DESCRIPTION: Composite: Renders a green line between points (85, 37) and (371, 180) then Places a yellow dot at position (430, 215) then Renders a black disk with center (37, 157) and radius 14.
; PLAN: r0=85(x1), r1=37(y1), r2=371(x2), r3=180(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=430(x), r6=215(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=37(x), r11=157(y), r12=14(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 85
LDI r1, 37
LDI r2, 371
LDI r3, 180
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 215
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 37
LDI r11, 157
LDI r12, 14
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
