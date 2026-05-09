; DESCRIPTION: Composite: Renders a yellow disk with center (104, 212) and radius 36 then Renders a white line between points (141, 57) and (95, 201) then Places a white dot at position (175, 52).
; PLAN: r0=104(x), r1=212(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x1), r6=57(y1), r7=95(x2), r8=201(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=175(x), r11=52(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 104
LDI r1, 212
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 57
LDI r7, 95
LDI r8, 201
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 175
LDI r11, 52
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
