; DESCRIPTION: Composite: Places a purple 74x83 rectangle at position (377, 113) then Places a black dot at position (275, 65) then Renders a green disk with center (109, 97) and radius 51.
; PLAN: r0=377(x), r1=113(y), r2=74(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x), r6=65(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=109(x), r11=97(y), r12=51(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 377
LDI r1, 113
LDI r2, 74
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 65
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 109
LDI r11, 97
LDI r12, 51
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
