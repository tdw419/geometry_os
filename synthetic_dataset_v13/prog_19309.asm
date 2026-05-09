; DESCRIPTION: Composite: Renders a white line between points (492, 74) and (37, 248) then Creates a cyan circular shape at (189, 161) with radius 13 then Sets a single blue pixel at (170, 25).
; PLAN: r0=492(x1), r1=74(y1), r2=37(x2), r3=248(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=189(x), r6=161(y), r7=13(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=170(x), r11=25(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 492
LDI r1, 74
LDI r2, 37
LDI r3, 248
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 161
LDI r7, 13
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 170
LDI r11, 25
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
