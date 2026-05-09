; DESCRIPTION: Composite: Renders a white disk with center (35, 194) and radius 32 then Renders a black line between points (322, 174) and (359, 114) then Places a green dot at position (162, 199).
; PLAN: r0=35(x), r1=194(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x1), r6=174(y1), r7=359(x2), r8=114(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=162(x), r11=199(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 35
LDI r1, 194
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 174
LDI r7, 359
LDI r8, 114
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 199
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
