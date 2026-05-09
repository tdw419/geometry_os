; DESCRIPTION: Composite: Renders a blue line between points (496, 41) and (359, 132) then Places a cyan dot at position (198, 62) then Renders a red disk with center (297, 194) and radius 36.
; PLAN: r0=496(x1), r1=41(y1), r2=359(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=198(x), r6=62(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=297(x), r11=194(y), r12=36(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 496
LDI r1, 41
LDI r2, 359
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 62
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 297
LDI r11, 194
LDI r12, 36
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
