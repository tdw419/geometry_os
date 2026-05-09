; DESCRIPTION: Composite: Renders a white disk with center (147, 93) and radius 33 then Renders a orange line between points (460, 67) and (56, 26) then Sets a single green pixel at (274, 176).
; PLAN: r0=147(x), r1=93(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=460(x1), r6=67(y1), r7=56(x2), r8=26(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=274(x), r11=176(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 147
LDI r1, 93
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 460
LDI r6, 67
LDI r7, 56
LDI r8, 26
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 176
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
