; DESCRIPTION: Composite: Places a white dot at position (210, 184) then Draws a white circle centered at (412, 158) with radius 74 then Renders a green line between points (378, 45) and (136, 238).
; PLAN: r0=210(x), r1=184(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=412(x), r6=158(y), r7=74(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=378(x1), r11=45(y1), r12=136(x2), r13=238(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 184
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 412
LDI r6, 158
LDI r7, 74
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 378
LDI r11, 45
LDI r12, 136
LDI r13, 238
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
