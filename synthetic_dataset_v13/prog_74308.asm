; DESCRIPTION: Composite: Renders a white line between points (147, 156) and (298, 5) then Creates a green circular shape at (117, 127) with radius 20 then Places a purple dot at position (47, 71).
; PLAN: r0=147(x1), r1=156(y1), r2=298(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=117(x), r6=127(y), r7=20(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=47(x), r11=71(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 147
LDI r1, 156
LDI r2, 298
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 127
LDI r7, 20
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 47
LDI r11, 71
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
