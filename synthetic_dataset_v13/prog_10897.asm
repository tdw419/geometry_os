; DESCRIPTION: Composite: Renders a white disk with center (476, 124) and radius 21 then Renders a black line between points (144, 158) and (327, 21) then Places a purple dot at position (241, 129).
; PLAN: r0=476(x), r1=124(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=144(x1), r6=158(y1), r7=327(x2), r8=21(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=241(x), r11=129(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 476
LDI r1, 124
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 144
LDI r6, 158
LDI r7, 327
LDI r8, 21
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 241
LDI r11, 129
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
