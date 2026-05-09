; DESCRIPTION: Composite: Places a white dot at position (260, 101) then Renders a yellow line between points (40, 70) and (298, 30) then Places a blue circle of radius 26 at center (373, 139).
; PLAN: r0=260(x), r1=101(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=40(x1), r6=70(y1), r7=298(x2), r8=30(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=373(x), r11=139(y), r12=26(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 260
LDI r1, 101
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 40
LDI r6, 70
LDI r7, 298
LDI r8, 30
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 373
LDI r11, 139
LDI r12, 26
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
