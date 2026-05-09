; DESCRIPTION: Composite: Renders a white disk with center (122, 155) and radius 28 then Draws a white line from (115, 136) to (51, 134) then Places a green dot at position (311, 231).
; PLAN: r0=122(x), r1=155(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=115(x1), r6=136(y1), r7=51(x2), r8=134(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=311(x), r11=231(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 122
LDI r1, 155
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 115
LDI r6, 136
LDI r7, 51
LDI r8, 134
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 311
LDI r11, 231
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
